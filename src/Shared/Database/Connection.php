<?php
declare(strict_types=1);
namespace ChezVous\Shared\Database;
use ChezVous\Config\Env; use PDO;
final class Connection { public static function make(): PDO { return new PDO(sprintf('mysql:host=%s;port=%s;dbname=%s;charset=utf8mb4', Env::get('DB_HOST','db'), Env::get('DB_PORT','3306'), Env::get('DB_DATABASE','chezvous')), Env::get('DB_USERNAME','chezvous'), Env::get('DB_PASSWORD',''), [PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC, PDO::ATTR_EMULATE_PREPARES=>false]); }}
