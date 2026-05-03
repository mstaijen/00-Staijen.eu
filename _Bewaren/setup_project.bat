@echo off
echo ================================
echo Project wordt opgezet...
echo ================================


REM ================================
REM MAPPENSTRUCTUUR
REM ================================

mkdir app
mkdir app\controllers
mkdir app\models
mkdir app\views

mkdir public
mkdir public\css
mkdir public\js

mkdir config
mkdir includes
mkdir database

mkdir modules
mkdir modules\muziek
mkdir modules\gereedschap
mkdir modules\puzzels

REM ================================
REM BASIS BESTANDEN
REM ================================

REM INDEX
echo ^<?php include '../includes/header.php'; ?^> > public\index.php
echo ^<h2^>Welkom op het dashboard^</h2^> >> public\index.php
echo ^<p^>Gebruik het menu om te navigeren.^</p^> >> public\index.php
echo ^<?php include '../includes/footer.php'; ?^> >> public\index.php

REM HEADER
echo ^<!DOCTYPE html^> > includes\header.php
echo ^<html^> >> includes\header.php
echo ^<head^> >> includes\header.php
echo ^<meta charset="UTF-8"^> >> includes\header.php
echo ^<title^>Dashboard^</title^> >> includes\header.php
echo ^<link rel="stylesheet" href="/css/main.css"^> >> includes\header.php
echo ^</head^> >> includes\header.php
echo ^<body^> >> includes\header.php
echo ^<header^> >> includes\header.php
echo ^<h1^>Gezins Dashboard^</h1^> >> includes\header.php
echo ^<nav^> >> includes\header.php
echo ^<a href="/index.php"^>Home^</a^> ^| >> includes\header.php
echo ^<a href="/modules/muziek/index.php"^>Muziek^</a^> ^| >> includes\header.php
echo ^<a href="/modules/puzzels/index.php"^>Puzzels^</a^> ^| >> includes\header.php
echo ^<a href="/modules/gereedschap/index.php"^>Gereedschap^</a^> ^| >> includes\header.php
echo ^<a href="/login.php"^>Login^</a^> >> includes\header.php
echo ^</nav^> >> includes\header.php
echo ^</header^> >> includes\header.php
echo ^<main^> >> includes\header.php

REM FOOTER
echo ^</main^> > includes\footer.php
echo ^<footer^> >> includes\footer.php
echo ^<p^>^&copy; 2026 Gezins Systeem^</p^> >> includes\footer.php
echo ^</footer^> >> includes\footer.php
echo ^</body^> >> includes\footer.php
echo ^</html^> >> includes\footer.php

REM ================================
REM AUTH SYSTEM (BASIS)
REM ================================

echo ^<?php > includes\auth.php
echo session_start(); >> includes\auth.php
echo if (!isset($_SESSION['user_id'])) { >> includes\auth.php
echo header("Location: /login.php"); >> includes\auth.php
echo exit; >> includes\auth.php
echo } >> includes\auth.php
echo ?^> >> includes\auth.php

REM LOGIN PAGINA
echo ^<?php include 'includes/header.php'; ?^> > public\login.php
echo ^<h2^>Login^</h2^> >> public\login.php
echo ^<form method="post" action="login_process.php"^> >> public\login.php
echo Gebruiker: ^<input type="text" name="username"^>^<br^> >> public\login.php
echo Wachtwoord: ^<input type="password" name="password"^>^<br^> >> public\login.php
echo ^<button type="submit"^>Login^</button^> >> public\login.php
echo ^</form^> >> public\login.php
echo ^<?php include 'includes/footer.php'; ?^> >> public\login.php

REM LOGOUT
echo ^<?php > public\logout.php
echo session_start(); >> public\logout.php
echo session_destroy(); >> public\logout.php
echo header("Location: /login.php"); >> public\logout.php
echo ?^> >> public\logout.php

REM ================================
REM DASHBOARD
REM ================================

echo ^<?php include '../includes/header.php'; ?^> > public\dashboard.php
echo ^<?php include '../includes/auth.php'; ?^> >> public\dashboard.php
echo ^<h2^>Dashboard^</h2^> >> public\dashboard.php
echo ^<div class="card"^>Muziek module^</div^> >> public\dashboard.php
echo ^<div class="card"^>Puzzel module^</div^> >> public\dashboard.php
echo ^<div class="card"^>Gereedschap module^</div^> >> public\dashboard.php
echo ^<?php include '../includes/footer.php'; ?^> >> public\dashboard.php

REM ================================
REM MODULES (BASIS PAGINA'S)
REM ================================

echo ^<?php include '../../includes/header.php'; ?^> > modules\muziek\index.php
echo ^<h2^>Muziek database^</h2^> >> modules\muziek\index.php
echo ^<?php include '../../includes/footer.php'; ?^> >> modules\muziek\index.php

echo ^<?php include '../../includes/header.php'; ?^> > modules\puzzels\index.php
echo ^<h2^>Puzzel database^</h2^> >> modules\puzzels\index.php
echo ^<?php include '../../includes/footer.php'; ?^> >> modules\puzzels\index.php

echo ^<?php include '../../includes/header.php'; ?^> > modules\gereedschap\index.php
echo ^<h2^>Gereedschap database^</h2^> >> modules\gereedschap\index.php
echo ^<?php include '../../includes/footer.php'; ?^> >> modules\gereedschap\index.php

REM ================================
REM DATABASE FILE
REM ================================

echo CREATE DATABASE gezinsdb; > database\setup.sql
echo USE gezinsdb; >> database\setup.sql
echo CREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(50), password VARCHAR(255), role ENUM('admin','user')); >> database\setup.sql

REM ================================
REM CSS
REM ================================

echo body { font-family: Arial; margin:0; } > public\css\main.css
echo header { background:#333; color:white; padding:10px; } >> public\css\main.css
echo nav a { color:white; margin-right:10px; } >> public\css\main.css
echo main { padding:20px; min-height:80vh; } >> public\css\main.css
echo footer { background:#eee; text-align:center; padding:10px; } >> public\css\main.css
echo .card { background:#f4f4f4; padding:15px; margin:10px 0; } >> public\css\main.css

echo ================================
echo Klaar! Project is aangemaakt.
echo ================================
pause