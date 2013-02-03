# encoding: utf-8
class AbstractDocument < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'docAbstract'
  self.primary_key = 'id'
  
  has_many :stock_movements, foreign_key: '_RecorderRRef', primary_key: 'rref'

  def rrefUnknown?()
    ((rref.nil? || rref_bin == '00000000000000000000000000000000') ? true : false )
  end

  def trefUnknown?()
    ((tref.nil? || tref_bin == '00000000') ? true : false)
  end

  def code()
    return "[nil]" if rrefUnknown?
    return "[#{rref_bin}]" if trefUnknown?

    sql = "EXEC spGetDocumentCode_WithTRefAndRRef #{tref_bin}, #{rref_bin}, '#{db_name}'"
    docData = connection.select_one(sql)
    if docData.nil? || docData['_Number'].nil?
      "[#{rref_bin}@#{db_name}]"
      # docData
    else
      docData['_Number']
    end
  end

  def postDate()
    return DateTime.new(0) if rrefUnknown? || trefUnknown?

  	# Возвращает дату проведения документа. Вычитать 2000 лет нужно из-за смещения, с которым 1С хранит данные в MSSQL
  	docData = connection.select_one("EXEC spGetDocumentCode_WithTRefAndRRef #{tref_bin}, #{rref_bin}, '#{db_name}'")
    docData.nil? ? DateTime.new(0) : (docData['_Date_Time'].nil? ? DateTime.new(0) : docData['_Date_Time'] - 2000.years)
  end

  def rref_bin()
    "0x#{rref.unpack('H*').join}"
  end

  def tref_bin()
    "0x#{tref.unpack('H*').join}"
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

  def columnHasNullsInArticles(column)
    stock_movements.each do |mv|
      return true if mv.article.nil? && (!eval("#{column}.nil?"))
    end

    return false
  end
  
  def hasNullsInHqArticles?()
    return columnHasNullsInArticles("mv.HQ_Q")
  end

  def hasNullsInCmpArticles?()
    return columnHasNullsInArticles("mv.CMP_Q")
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
