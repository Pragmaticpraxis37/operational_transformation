require './lib/operational_transformation.rb'

describe 'Operational Transformation' do
  it 'exists' do
    ot = OperationalTransformation.new('abc')

    expect(ot.class).to eq(OperationalTransformation)
  end

  # insert_insert single letter

  it 'can perform two inserts when insert 1 is at an index before insert 2 - single letter' do
    ot = OperationalTransformation.new('abc')

    ot.insert_insert(1, 'x', 1, 2, 'y', 2)

    expect(ot.words).to eq('axbyc')
  end

  it 'can perform two insertions when insert 1 and insert 2 are at the same index - single letter' do
    ot = OperationalTransformation.new('abc')

    ot.insert_insert(1, 'x', 1, 1, 'y', 2)

    expect(ot.words).to eq('axybc')
  end

  it 'can perform two inserts when insert 1 is at an index after insert 2 - single letter' do
    ot = OperationalTransformation.new('abc')

    ot.insert_insert(2, 'x', 1, 1, 'y', 2)

    expect(ot.words).to eq('aybxc')
  end

  #insert_insert multiple letters

  it 'can perform two inserts when insert 1 is at an index before insert 2 - multiple letters' do
    ot = OperationalTransformation.new('abc')

    ot.insert_insert(1, 'xoxo', 1, 2, 'yogo', 2)

    expect(ot.words).to eq('axoxobyogoc')
  end

  it 'can perform two inserts when insertion 1 and insertion 2 are at the same index - multiple letters' do
    ot = OperationalTransformation.new('abc')

    ot.insert_insert(1, 'xoxo', 1, 1, 'yogo', 2)

    expect(ot.words).to eq('axoxoyogobc')
  end

  it 'can perform two inserts when insert 1 is at an index after insert 2 - multiple letters' do
    ot = OperationalTransformation.new('abc')

    ot.insert_insert(2, 'xoxo', 1, 1, 'yogo', 2)

    expect(ot.words).to eq('ayogobxoxoc')
  end

  #insert_delete - single letters

  it 'can perform an insert and delete when the insertion is at an index before delete - single letter' do
    ot = OperationalTransformation.new('abcd')

    ot.insert_delete(1, 'x', 1, 2, 1, 2)

    expect(ot.words).to eq('axbd')
  end

  it 'can perform an insert and delete at the same index - single letter' do
    ot = OperationalTransformation.new('abcd')

    ot.insert_delete(1, 'x', 1, 1, 1, 2)

    expect(ot.words).to eq('axcd')
  end

  it 'can perform an insert and delete when the insertion is at an index after delete - single letter' do
    ot = OperationalTransformation.new('abcd')

    ot.insert_delete(4, 'x', 1, 1, 1, 2)

    expect(ot.words).to eq('acdx')
  end

  #insert_delete - multiple letters

  it 'can perform an insert and delete when the insertion is at an index before delete - multiple letters' do
    ot = OperationalTransformation.new('abcd')

    ot.insert_delete(1, 'xoxo', 1, 2, 2, 2)

    expect(ot.words).to eq('axoxob')
  end

  it 'can perform an insert and delete at the same index - multiple letters' do
    ot = OperationalTransformation.new('abcd')

    ot.insert_delete(1, 'xoxo', 1, 1, 2, 2)

    expect(ot.words).to eq('axoxod')
  end

  it 'can perform an insert and delete when the insertion is at an index after delete - multiple letters' do
    ot = OperationalTransformation.new('abcd')

    ot.insert_delete(4, 'xoxo', 1, 1, 2, 2)

    expect(ot.words).to eq('adxoxo')
  end

  #delete_insert - single letter

  it "can perform a delete and insert when the delete is at an index before insert - single letter" do
    ot = OperationalTransformation.new('abcd')

    ot.delete_insert(1, 1, 1, 2, 'x', 2)

    expect(ot.words).to eq('axcd')
  end

  it "can perform a delete and insert at the same index - single letter" do
    ot = OperationalTransformation.new('abcd')

    ot.delete_insert(1, 1, 1, 1, 'x', 2)

    expect(ot.words).to eq('axcd')
  end

  it "can perform a delete and insert when the delete is at an index after insert - single letter" do
    ot = OperationalTransformation.new('abcd')

    ot.delete_insert(3, 1, 1, 2, 'x', 2)

    expect(ot.words).to eq('abxc')
  end

  #delete_insert - multiple letters

  it "can perform a delete and insert when the delete is at an index before insert - single letter" do
    ot = OperationalTransformation.new('abcd')

    ot.delete_insert(1, 1, 1, 2, 'xoxo', 2)

    expect(ot.words).to eq('axoxocd')
  end

  it "can perform a delete and insert at the same index - single letter" do
    ot = OperationalTransformation.new('abcd')

    ot.delete_insert(1, 1, 1, 1, 'xoxo', 2)

    expect(ot.words).to eq('axoxocd')
  end

  it "can perform a delete and insert when the delete is at an index after insert - single letter" do
    ot = OperationalTransformation.new('abcd')

    ot.delete_insert(3, 1, 1, 2, 'xoxo', 2)

    expect(ot.words).to eq('abxoxoc')
  end

  #delete_delete - single letter

  it "can perform two deletes when the first delete is at an index before the second delete - single letter" do
    ot = OperationalTransformation.new('abcd')

    ot.delete_delete(1, 1, 1, 2, 1, 2)

    expect(ot.words).to eq('ad')
  end

  it "can perform two deletes at the same index with the same lengths - single letter" do
    ot = OperationalTransformation.new('abcd')

    ot.delete_delete(1, 1, 1, 1, 1, 2)

    expect(ot.words).to eq('acd')
  end

  it "can perform two deletes when the first delete is at an index after the second delete - single letter" do
    ot = OperationalTransformation.new('abcd')

    ot.delete_delete(2, 1, 1, 1, 1, 2)

    expect(ot.words).to eq('ad')
  end

  #delete_delete - multiple letters

  it "can perform two deletes when the first delete is at an index before the second delete - multiple letters" do
    ot = OperationalTransformation.new('abcd')

    ot.delete_delete(1, 1, 1, 2, 2, 2)

    expect(ot.words).to eq('a')
  end

  it "can perform two deletes when the first delete is at an index before the second delete, even if it surpasses the remaining index left after second delete is completed - multiple letters" do
    ot = OperationalTransformation.new('abcd')

    ot.delete_delete(1, 5, 1, 2, 2, 2)

    expect(ot.words).to eq('a')
  end

  it "can perform two deletes at the same index with different lengths - multiple letters" do
    ot = OperationalTransformation.new('abcd')

    ot.delete_delete(1, 2, 1, 1, 1, 2)

    expect(ot.words).to eq('ad')
  end

  it 'can perform two deletes when the first delete is at an index after the second delete and it requests a delete that would cover the second delete - multiple letters' do
    ot_1 = OperationalTransformation.new('abcdef')

    ot_1.delete_delete(2, 1, 1, 1, 3, 2)

    expect(ot_1.words).to eq('aef')

    ot_2 = OperationalTransformation.new('abcdef')

    ot_2.delete_delete(2, 3, 1, 1, 3, 2)

    expect(ot_2.words).to eq('af')

    ot_3 = OperationalTransformation.new('abcdef')

    ot_3.delete_delete(3, 2, 1, 1, 1, 2)

    expect(ot_3.words).to eq('acf')
  end
end
