module dff (
    input  wire clock, input  wire reset, input  wire d_in, output reg q_out,
    output wire qb_out);

    always @(posedge clock)
      begin
        if (reset)
            q_out <= 1'b0;
        else
            q_out <= d_in;
    end

    assign qb_out = ~q_out;

endmodule
