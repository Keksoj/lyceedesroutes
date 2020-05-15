# Exporter en site statique avec mdbook

Prérequis :
* machine linux
* git installé

Installer [rust](https://www.rust-lang.org/learn/get-started) :

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Ajouter Cargo au `PATH` :

```sh
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> $HOME/.profile

```

Installer mdbook avec Cargo :

```sh
cargo install mdbook --no-default-features --features output --vers "^0.1.0"
```


Cloner ce dépôt sur votre machine, lancer le script (le rendre exécutable au besoin) :

```sh
git clone https://github.com/Keksoj/lyceedesroutes.git
cd lyceedesroutes
chmod +x mdbook.sh
./mdbook.sh
```
