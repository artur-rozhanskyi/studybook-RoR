shared_examples_for 'tickets_email' do
  it 'sends buy email' do
    expect(email.subject).to eql(subject)
  end

  it 'renders the receiver email' do
    expect(email.to).to eql([user.email])
  end

  it 'assigns @name' do
    expect(email.body.encoded).to match(user.name)
  end

  it 'renders the sender email' do
    expect(email.from).to eql(['from@example.com'])
  end
end
