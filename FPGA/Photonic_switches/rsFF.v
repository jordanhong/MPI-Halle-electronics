module rsFF (
    input reset,
    input S, R,
    output out
);

    // Use a pair of T flip flops
    // T flip flop 1:   Controls the toggle of Qs, 
    //                  enabled by ~out (only active when out = 0)
    // T flip flop 2:   Controls the toggle of Qr, 
    //                  enabled by out  (only active when out = 1)
    //
    // Output toggles on alternating R and S rising edge. 
    // (Implemented by a XOR)
    // Repeating S and R does not matter.
    //

    wire    Ds, Dr;
    reg     Qs, Qr;


    assign Ds = (~out)  ^ Qs;
    assign Dr = (out)   ^ Qr;
    assign out = Qs ^ Qr;



    // Tff 1
    always @(posedge S, posedge reset)begin
        if (reset)  Qs <= 0;
        else        Qs <= Ds;
    end

    // Tff 2
    always @(posedge R, posedge reset) begin
        if (reset)  Qr <= 0;
        else        Qr <= Dr;
    end


endmodule
        
