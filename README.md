# cdp_personalization_engine

## Prerequisites

- **Python 3.8+**
- **Qdrant** for vector-based recommendations
- **Docker** and **Docker Compose** (optional for containerized setup)


## Installation

1. **Clone the repository**:

    ```bash
    git clone https://github.com/ntd284/cdp_personalization_engine.git
    cd cdp_personalization_engine
    ```

2. **Install dependencies**:

    Run docker compose

    ```bash
    docker compose up -d --build
    ```
## Example

Here’s how to request **add_profiles**:

```bash
curl -X POST http://localhost:8000/add-profiles/ \
     -H "Content-Type: application/json" \
     -d '[
            {
                "profile_id": "crm_5002",
                "page_view_keywords": [
                "wine",
                "cocktails",
                "drinkware"
                ],
                "purchase_keywords": [
                "wine glasses",
                "cocktail shaker"
                ],
                "interest_keywords": [
                "entertainment",
                "food and drink",
                "socializing"
                ],
                "additional_info": {
                "age": 39,
                "location": "Italy"
                }
            }
        ]'
```
Here’s how to request **add_products**:

```bash
curl -X POST http://localhost:8000/add-products/ \
     -H "Content-Type: application/json" \
     -d '[
            {
            "product_id": "item_61",
            "product_name": "Portable Power Bank",
            "product_category": "Electronics",
            "product_keywords": ["portable", "charging", "tech"],
            "additional_info": {"brand": "Anker", "price": 50}
            }
         ]'
```

Here’s how to request **check-profile-for-recommendation**:

```bash
curl -X POST http://localhost:8000/check-profile-for-recommendation/ \
     -H "Content-Type: application/json" \
     -d '{
        "profile_id": "crm_9",
        "page_view_keywords": ["Camera","travel", "Drone"],
        "purchase_keywords": ["laptop", "nvidia"],
        "interest_keywords": ["adventure", "Travel"],
        "additional_info": {"age": 38, "location": "Vietnam"},
        "max_recommendation_size": 10,
        "except_product_ids" : ["item_10","item_5"]
        }'
```