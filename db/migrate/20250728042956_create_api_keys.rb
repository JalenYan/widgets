class CreateApiKeys < ActiveRecord::Migration[8.0]
  def change
    create_table :api_keys do |t|
      t.text :key, null: false,
        comment: "The actual key clients should use"

      t.text :client_name, null: false,
        comment: "Name of the client who was assigned this key"

      t.datetime :created_at, null: false,
        comment: "When this key was created"

      t.datetime :deactivated_at, null: true,
        comment: "When the key was deactivated. " +
                  "When present, this key is not valid."

      # Note: No updated_at because there should be no updates
      #       to rows here other than to deactivate
    end
    add_index :api_keys, :key, unique: true,
              comment: "API keys have to be unique or we don't who is accessing us"

    add_index :api_keys, :client_name,
              unique: true,
              where: "deactivated_at IS NULL",
              comment: "We need to be able to find keys by client"
  end
end
