require 'rails_helper'
include UNRParkingZones
include UNRParkingZonesLogic

describe 'UNR Parking Zones Logic' do

  it 'sets UNR outline initially' do
    @pass = ''
    find_available_zones
    expect(@zones).to match_array([unr_outline])
  end

  it 'finds correct blue zones' do
    @pass = 'Blue'
    find_available_zones
    expect(@zones).to match_array([blue1, blue2, blue3, unr_outline])
  end

  it 'finds correct green zones' do
    @pass = 'Green'
    find_available_zones
    expect(@zones).to match_array([green1, green2, green3, green4, green5, green6,
                                   green7, green8, blue1, blue2, blue3, unr_outline])
  end

  it 'finds correct purple zones' do
    @pass = 'Purple'
    find_available_zones
    expect(@zones).to match_array([purple1, purple2, purple3, purple4, unr_outline])
  end

  it 'finds correct orange zones' do
    @pass = 'Orange'
    find_available_zones
    expect(@zones).to match_array([orange1, blue1, blue2, blue3, green1, green2, green3,
                                  green4, green5, green6, green7, green8, unr_outline])
  end

  it 'finds correct yellow zones' do
    @pass = 'Yellow'
    @number = '1'
    find_available_zones
    expect(@zones).to match_array([yellow1, blue1, blue2, blue3, green1, green2, green3,
                                   green4, green5, green6, green7, green8, unr_outline])
  end

  it 'finds correct silver zones during normal hours' do
    @pass = 'Silver'
    @number = '16'
    @time = 1200
    find_available_zones
    expect(@zones).to match_array([*silver16, blue1, blue2, blue3, green1, green2, green3,
                                   green4, green5, green6, green7, green8, unr_outline])
  end

  it 'finds correct silver zones during after hours' do
    @pass = 'Silver'
    @number = '11'
    @time = 1800
    find_available_zones
    expect(@zones).to match_array([*silver1, *silver2, *silver3, *silver5, *silver6, *silver7,
                                   *silver8, *silver9, *silver10, *silver11, *silver12, *silver13,
                                   *silver14, *silver15, *silver16, *silver17, blue1, blue2, blue3,
                                   green1, green2, green3, green4, green5, green6, green7, green8, unr_outline])
  end

  it 'finds correct tan zones' do
    @pass = 'Tan'
    find_available_zones
    expect(@zones).to match_array([blue1, blue2, blue3, green1, green2, green3, green4,
                                   green5, green6, green7, green8, unr_outline])
  end

  it 'finds correct east campus resident zones during normal hours' do
    @pass = 'East Campus Resident'
    @time = 800
    find_available_zones
    expect(@zones).to match_array([unr_outline])
  end

  it 'finds correct east campus resident zones during after hours' do
    @pass = 'East Campus Resident'
    @time = 500
    find_available_zones
    expect(@zones).to match_array([silver17[0], blue1, blue2, blue3, green1, green2, green3,
                                   green4, green5, green6, green7, green8, unr_outline])
  end

  it 'finds correct evening zones between 3:30 and 5:30 pm' do
    @pass = 'Evening'
    @time = 1600
    find_available_zones
    expect(@zones).to match_array([silver17[0], unr_outline])
  end

  it 'finds correct evening zones between 5:30 pm and 7:00 am' do
    @pass = 'Evening'
    @time = 600
    find_available_zones
    expect(@zones).to match_array([*silver1, *silver2, *silver3, *silver5, *silver6, *silver7,
                              *silver8, *silver9, *silver10, *silver11, *silver12, *silver13,
                              *silver14, *silver15, *silver16, *silver17, blue1, blue2, blue3,
                              green1, green2, green3, green4, green5, green6, green7, green8, unr_outline])
  end

  it 'finds correct evening zones during normal hours' do
    @pass = 'Evening'
    @time = 1000
    find_available_zones
    expect(@zones).to match_array([unr_outline])
  end
end
