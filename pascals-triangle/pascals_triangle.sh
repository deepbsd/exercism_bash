#!/usr/bin/env bash

main(){

    constructor(num){
        this.rows = this.generateRows(num);
        this.lastRow = this.rows[num-1];
    }
    generateRows(num){
        let rows = [];
        for (let i=0; i<num; i++){
            let newRow = [];
            for (let col=0; col<=i; col++){
                if (col===i || col===0) { newRow.push(1); }
                else { newRow.push(rows[i-1][col-1]+rows[i-1][col]); }
            }
            rows.push(newRow);
        }
        return rows;
    }
    echo
}

main "$@"
