require 'rails_helper'

describe Contact do
  it "is valid with name, email and content" do
    contact = Contact.new(name: '今井田', email: 'user@example.com', content: '問い合わせ')
    expect(contact).to be_valid
  end

  it "is invalid without name" do
    contact = Contact.new(email: 'user@example.com', content: '問い合わせ')
    expect(contact).not_to be_valid
  end

  it "is invalid without email" do
    contact = Contact.new(name: '今井田', content: '問い合わせ')
    expect(contact).not_to be_valid
  end

  it "is invalid without content" do
    contact = Contact.new(name: '今井田', email: 'user@example.com')
    expect(contact).not_to be_valid
  end

  it "has error messages without name, email or content" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:name]).to include("を入力してください")
    expect(contact.errors[:email]).to include("を入力してください")
    expect(contact.errors[:content]).to include("を入力してください")
  end
end
