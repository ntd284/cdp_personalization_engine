from personalization_router import api_personalization

# Run the FastAPI api_personalization
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(api_personalization, host="uvicorn_container", port=8000)