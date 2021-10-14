require_relative "../lib/trader"

describe "the crypto_scrapper method" do
    it "should be an entry called 'BTC'" do
        expect(crypto_scrapper.any? {|h| h['USDT']}).to eq(true)
    end
    it "should be an entry called 'ETH'" do
        expect(crypto_scrapper.any? {|h| h['ETH']}).to eq(true)
    end
end