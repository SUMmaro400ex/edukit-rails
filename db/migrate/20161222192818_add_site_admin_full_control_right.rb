class AddSiteAdminFullControlRight < ActiveRecord::Migration[5.0]
  def up
    Right.create!(
        code: "SAFC",
        short_description: "Site Admin actions",
        long_description: "Able to utilize site administration controls",
        title: "Site Admin Full Control",
        public: false
    )
  end

  def down
    Right.find_by_code("SAFC").destroy!
  end
end
