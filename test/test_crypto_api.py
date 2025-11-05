from webapp.crypto_api import transform


def test_transform():
    test_fake_data = {
   
        "data": {
            "BTC": [
                    {
                        "id": 1,
                        "name": "Bitcoin",
                        "symbol": "BTC",
                            "quote": {
                            "USD": {
                                    "price": 103929.32609335119,
                                
                                }
                        }
                    },
            ]
        }
    }
    result = transform(test_fake_data)
    #assertions 
    assert result["symbol"] == "BTC"
    assert result["price"] == 103929.32609335119

