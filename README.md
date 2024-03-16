# mavka-pack-revival

Репозиторій містить прототип рішення для
управління паками з [пак.укр](https://пак.укр/),
котре буде доступне як для [Джеджалика](https://github.com/mavka-ukr/jejalyk)
, так і для [МаМи](https://github.com/mavka-ukr/mavka).

## Використання

1. Встановлення паків:

    ```bash
    make install
    ```

    Скрипт `install_packs.sh` завантажить архіви у `.подарунок/кеш`,
    та розпакує кожен із них у `подарунок/назва_паку`.

2. Старт:

    - МаМа:

        ```bash
        мавка старт.м
        ```

    - Джеджалик:

        ```bash
        джеджалик старт старт.м
        ```
