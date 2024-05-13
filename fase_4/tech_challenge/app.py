import streamlit as st
from prophet.serialize import model_from_json
from prophet.plot import plot_plotly
import plotly.graph_objects as go


# Para rodar a aplicação é necessário rodar o comando "streamlit run app.py" no terminal dentro do venv

# Adicionando um texto no streamlit
st.write("# Previsão do valor do petróleo !")

st.write("## Quantidade de dias para previsão")
input_qtd_dias_pred = int(st.slider(label='dias', min_value=1, max_value=365))


if st.button("Fazer previsão"):
    # Carregando o modelo
    with open('models/model_prophet_v1.json', 'r') as fin:
        model = model_from_json(fin.read())  # Load model


    # Previsões
    future = model.make_future_dataframe(periods=input_qtd_dias_pred)
    forecast_df = model.predict(future)

    # Plot da previsão
    # model.plot(forecast_df, figsize=(20,6))
    fig = plot_plotly(model, forecast_df)
    # fig.update_layout(xaxis_range=[future.min(), future.max()])
    st.plotly_chart(fig)