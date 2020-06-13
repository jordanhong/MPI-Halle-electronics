module rsLatch(
    input en,
    input S, R,
    output Q, Qb
);

    assign Q = ~ ( (R&en) | Qb );
    assign Qb = ~ ( (S&en) | Q );

endmodule
    
