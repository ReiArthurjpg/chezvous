<?php
declare(strict_types=1);
namespace ChezVous\Features\Events;
use PDO;
final class EventRepository { public function __construct(private PDO $db) {} public function all(): array { return $this->db->query('SELECT * FROM events ORDER BY event_date, event_time')->fetchAll(); } public function create(array $d): int { $s=$this->db->prepare('INSERT INTO events (client_name,event_type,event_date,event_time,venue,guest_count,commercial_owner,amount,budget_file) VALUES (:client_name,:event_type,:event_date,:event_time,:venue,:guest_count,:commercial_owner,:amount,:budget_file)'); $s->execute($d); return (int)$this->db->lastInsertId(); }}
