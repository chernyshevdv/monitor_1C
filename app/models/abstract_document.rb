# encoding: utf-8
class AbstractDocument < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'docAbstract'
  self.primary_key = 'id'
  
  has_many :stock_movements, foreign_key: '_RecorderRRef', primary_key: 'rref'

  def code()
    return "[nil]" if rref.nil? || rref.unpack('H*').join == '00000000000000000000000000000000'
    return "[0x#{rref.unpack('H*').join}]" if tref.nil? || tref.unpack('H*').join == '00000000'

    sql = "EXEC spGetDocumentCode_WithTRefAndRRef 0x#{tref.unpack('H*').join}, 0x#{rref.unpack('H*').join}, '#{db_name}'"
    docData = connection.select_one(sql)
    if docData.nil? || docData['_Number'].nil?
      "[0x#{rref.unpack('H*').join}@#{db_name}]"
      # docData
    else
      docData['_Number']
    end
  end

  def postDate()
    return DateTime.new(0) if rref.nil? || tref.nil? || rref.unpack('H*').join == '00000000000000000000000000000000' || tref.unpack('H*').join == '00000000'

  	# Возвращает дату проведения документа. Вычитать 2000 лет нужно из-за смещения, с которым 1С хранит данные в MSSQL
  	docData = connection.select_one("EXEC spGetDocumentCode_WithTRefAndRRef 0x#{tref.unpack('H*').join}, 0x#{rref.unpack('H*').join}, '#{db_name}'")
    docData.nil? ? DateTime.new(0) : (docData['_Date_Time'].nil? ? DateTime.new(0) : docData['_Date_Time'] - 2000.years)
  end

  def rref_bin()
    "0x#{rref.unpack('H*').join}"
  end

  def missingInHQ?()
    stock_movements.each do |mv|
      return false if !mv.HQ_Q.nil?
    end

    return true
  end

  def missingInCMP?()
    stock_movements.each do |mv|
      return false if !mv.CMP_Q.nil?
    end

    return true
  end

  def hasNullsInHqArticles?()
    stock_movements.each do |mv|
      return true if mv.article.nil? && (!mv.HQ_Q.nil?)
    end

    return false
  end

  def hasNullsInCmpArticles?()
    stock_movements.each do |mv|
      return true if mv.article.nil? && (!mv.CMP_Q.nil?)
    end

    return false
  end

  def possibleCauses()
    causes = []
    if missingInHQ?
      causes << 'Документ отсутствует в базе ЦО'
    end
    if missingInCMP?
      causes << 'Документ отсутствует в базе ЦМП'
    end
    if hasNullsInHqArticles?
      causes << 'В базе ЦО у документа есть строки с пустой номенклатурой'
    end
    if hasNullsInCmpArticles?
      causes << 'В базе ЦМП у документа есть строки с пустой номенклатурой'
    end

    causes 
  end
end