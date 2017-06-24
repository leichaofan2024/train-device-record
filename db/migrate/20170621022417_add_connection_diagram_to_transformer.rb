class AddConnectionDiagramToTransformer < ActiveRecord::Migration[5.0]
  def change
    add_column :transformers, :connection_diagram, :string
  end
end
