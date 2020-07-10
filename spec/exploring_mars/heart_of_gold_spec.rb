# frozen_string_literal: true

RSpec.describe(ExploringMars::HeartOfGold) do
  context '#move' do
    let(:initial_position) { { x: 1, y: 2 } }
    ExploringMars::Map.map_size = { x: 5, y: 5 }

    subject(:heart_of_gold) { ExploringMars::HeartOfGold.new(initial_position, direction) }

    shared_examples 'moving heart_of_gold' do
      it 'moves correctly' do
        subject.move

        expect(subject.current_position).to(eq(expected_position))
      end
    end

    context 'moving one unit' do
      context 'moves one unit when facing north' do
        let(:direction) { :north }
        let(:expected_position) { '1 3 N' }

        it_behaves_like 'moving heart_of_gold'
      end

      context 'moves one unit when facing south' do
        let(:direction) { :south }
        let(:expected_position) { '1 1 S' }

        it_behaves_like 'moving heart_of_gold'
      end

      context 'moves one unit when facing east' do
        let(:direction) { :east }
        let(:expected_position) { '2 2 E' }

        it_behaves_like 'moving heart_of_gold'
      end

      context 'moves one unit when facing west' do
        let(:direction) { :west }
        let(:expected_position) { '0 2 W' }

        it_behaves_like 'moving heart_of_gold'
      end
    end

    context 'moving all around wind rose' do
      context 'when moving all directions to the left' do
        let(:direction) { :north }
        let(:expected_position) { '1 2 N' }
        it 'expect to be in north again' do
          subject.left
          subject.left
          subject.left
          subject.left

          expect(subject.current_position).to(eq(expected_position))
        end
      end

      context 'when moving all directions to the right' do
        let(:direction) { :north }
        let(:expected_position) { '1 2 N' }
        it 'expect to be in north again' do
          subject.right
          subject.right
          subject.right
          subject.right

          expect(subject.current_position).to(eq(expected_position))
        end
      end
    end

    context 'moving a complex movement' do
      context 'when moving LMLMLMLMM' do
        let(:direction) { :north }
        let(:initial_position) { { x: 1, y: 2 } }
        let(:expected_position) { '1 3 N' }

        it 'expect to be 1 3 N' do
          subject.left
          subject.move
          subject.left
          subject.move
          subject.left
          subject.move
          subject.left
          subject.move
          subject.move

          expect(subject.current_position).to(eq(expected_position))
        end
      end

      context 'when moving MMRMMRMRRM' do
        let(:direction) { :east }
        let(:initial_position) { { x: 3, y: 3 } }
        let(:expected_position) { '5 1 E' }

        it 'expect to be 5 1 E' do
          subject.move
          subject.move
          subject.right
          subject.move
          subject.move
          subject.right
          subject.move
          subject.right
          subject.right
          subject.move

          expect(subject.current_position).to(eq(expected_position))
        end
      end
    end

    context 'not moving when on plataform limit' do
      context 'when 0 0 S' do
        let(:direction) { :south }
        let(:initial_position) { { x: 0, y: 0 } }
        let(:expected_position) { '0 0 S' }

        it 'stands still' do
          subject.move
          subject.move
          subject.move
          subject.move

          expect(subject.current_position).to(eq(expected_position))
        end
      end

      context 'when 0 0 W' do
        let(:direction) { :west }
        let(:initial_position) { { x: 0, y: 0 } }
        let(:expected_position) { '0 0 W' }

        it 'stands still' do
          subject.move
          subject.move
          subject.move
          subject.move

          expect(subject.current_position).to(eq(expected_position))
        end
      end

      context 'when max max N' do
        let(:direction) { :north }
        let(:initial_position) { { x: 5, y: 5 } }
        let(:expected_position) { '5 5 N' }

        it 'stands still' do
          subject.move
          subject.move
          subject.move
          subject.move

          expect(subject.current_position).to(eq(expected_position))
        end
      end

      context 'when max max E' do
        let(:direction) { :east }
        let(:initial_position) { { x: 5, y: 5 } }
        let(:expected_position) { '5 5 E' }

        it 'stands still' do
          subject.move
          subject.move
          subject.move
          subject.move

          expect(subject.current_position).to(eq(expected_position))
        end
      end
    end
  end
end
