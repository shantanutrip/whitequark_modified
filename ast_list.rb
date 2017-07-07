class AstList
  @@astListStore
  def initialize
    @@astListStore = []
  end
  def self.astListStore
    @@astListStore
  end
  def self.astListStoreAdd(rootNode)
    @@astListStore << rootNode
  end
end