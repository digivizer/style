# encoding: utf-8
# frozen_string_literal: true

require 'spec_helper'
require './lib/dgvz_method_length'

describe RuboCop::Cop::Metrics::DGVZMethodLength, :config do
  subject(:cop) { described_class.new(config) }
  let(:cop_config) { { 'Max' => 5,  'Blacklist' => ['.error', '.info', '.debug', '.fatal', '.trace'] } }


  it 'accept a method with .error' do
    inspect_source(cop, ['def m',
                         'logger.error{"abc"}',
                         'logger.error{"abc"}',
                         'logger.error{"abc"}',
                         'logger.error{"abc"}',
                         'logger.error{"abc"}',
                         'logger.error{"abc"}',
                         'logger.error{"abc"}',
                         'logger.error{"abc"}',
                         'end'])
    expect(cop.offenses).to be_empty
  end

  it 'accept a method with .info' do
    inspect_source(cop, ['def m',
                         'logger.info{"abc"}',
                         'logger.info{"abc"}',
                         'logger.info{"abc"}',
                         'logger.info{"abc"}',
                         'logger.info{"abc"}',
                         'logger.info{"abc"}',
                         'logger.info{"abc"}',
                         'logger.info{"abc"}',
                         'end'])
    expect(cop.offenses).to be_empty
  end

  it 'accept a method with .debug' do
    inspect_source(cop, ['def m',
                         'logger.debug{"abc"}',
                         'logger.debug{"abc"}',
                         'logger.debug{"abc"}',
                         'logger.debug{"abc"}',
                         'logger.debug{"abc"}',
                         'logger.debug{"abc"}',
                         'logger.debug{"abc"}',
                         'logger.debug{"abc"}',
                         'end'])
    expect(cop.offenses).to be_empty
  end

  it 'accept a method with .fatal' do
    inspect_source(cop, ['def m',
                         'logger.fatal{"abc"}',
                         'logger.fatal{"abc"}',
                         'logger.fatal{"abc"}',
                         'logger.fatal{"abc"}',
                         'logger.fatal{"abc"}',
                         'logger.fatal{"abc"}',
                         'logger.fatal{"abc"}',
                         'logger.fatal{"abc"}',
                         'end'])
    expect(cop.offenses).to be_empty
  end

  it 'accept a method with .trace' do
    inspect_source(cop, ['def m',
                         'logger.trace{"abc"}',
                         'logger.trace{"abc"}',
                         'logger.trace{"abc"}',
                         'logger.trace{"abc"}',
                         'logger.trace{"abc"}',
                         'logger.trace{"abc"}',
                         'logger.trace{"abc"}',
                         'logger.trace{"abc"}',
                         'end'])
    expect(cop.offenses).to be_empty
  end

  it 'accepts a method with less than 5 lines' do
    inspect_source(cop, ['def m()',
                         '  a = 1',
                         '  a = 2',
                         '  a = 3',
                         '  a = 4',
                         'end'])
    expect(cop.offenses).to be_empty
  end

  it 'rejects a method with more than 5 lines' do
    inspect_source(cop, ['def m()',
                         '  a = 1',
                         '  a = 2',
                         '  a = 3',
                         '  a = 4',
                         '  a = 5',
                         '  a = 6',
                         'end'])
    expect(cop.offenses.size).to eq(1)
  end

  it 'does not count blank lines' do
    inspect_source(cop, ['def m()',
                         '  a = 1',
                         '  a = 2',
                         '  a = 3',
                         '  a = 4',
                         '',
                         '',
                         '  a = 7',
                         'end'])
    expect(cop.offenses).to be_empty
  end

  it 'accepts empty methods' do
    inspect_source(cop, ['def m()',
                         'end'])
    expect(cop.offenses).to be_empty
  end
end
