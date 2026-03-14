/*
 * Problem: $(PROBLEM)
 * Judge: $(JUDGE)
 * URL: $(URL)
 * Date: $(DATE)
 */

use std::io::{self, BufRead};

fn solve() {
    let stdin = io::stdin();
    let mut lines = stdin.lock().lines();

    // Your logic here
    if let Some(Ok(line)) = lines.next() {
        let n: i32 = line.trim().parse().unwrap();
        println!("{}", n);
    }
}

fn main() {
    solve();
}
