# frozen_string_literal: true

require 'version'
require 'logger'
require 'digest'
require 'json'

module BlockChain
  # Block
  class Block
    attr_reader :chain

    class Error < StandardError; end

    def initialize
      @transaction_pool = []
      @chain = []
      @neighbours = []
      create_block(0, 'init_hash')
    end

    def create_block(nonce, previous_hash)
      block = {
        timestamp: Time.now.to_f,
        transactions: @transaction_pool,
        nonce: nonce,
        previous_hash: previous_hash
      }
      @chain.append(block)
      @transaction_pool = []
      block
    end
  end
end

def pprint(chains)
  chains.each_with_index do |chain, i|
    print "#{'=' * 25}Chain#{i}#{'=' * 25}\n"
    chain.each do |k, v|
      print "#{k.to_s.ljust(15)}#{v}\n"
    end
  end
  print "#{'*' * 25}\n"
end

if $PROGRAM_NAME == __FILE__
  block_chain = BlockChain::Block.new
  pprint(block_chain.chain)
  block_chain.create_block(5, 'hash 1')
  pprint(block_chain.chain)
  block_chain.create_block(2, 'hash 2')
  pprint(block_chain.chain)
end
