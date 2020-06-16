module rsLatch(
    input en,
    input reset,
    input S, R,
    output Q, Qb
);

    assign Q = ~ ( (R&en) | Qb | reset);
    assign Qb = ~ ( (S&en) | Q | reset);

endmodule
    
