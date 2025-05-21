import duckdb
import streamlit as st
import pandas as pd
from pathlib import Path

db_path = Path(__file__).resolve().parents[1] / "data_warehouse/ads.duckdb"

st.title("Job Dashboard")

@st.cache_data(ttl=300)
def load_data():
    con = duckdb.connect(db_path, read_only=True)
    df = con.execute("SELECT * FROM staging.original_headline").fetchdf()
    con.close()
    return df

st.write(load_data())

