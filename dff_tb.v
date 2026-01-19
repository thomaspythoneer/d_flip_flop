`timescale 1ns/1ps

module dff_tb;

    reg clk;
    reg reset;
    reg d;
    wire q;
    wire qb;

    parameter CYCLE = 10;

  dff DUT ( .clock(clk), .reset(reset), .d_in(d), .q_out(q), .qb_out(qb));


    always begin
        #(CYCLE/2) clk = ~clk;
    end


    task rst_dut;
        begin
            @(negedge clk);
            reset = 1'b1;
            @(negedge clk);
            reset = 1'b0;
        end
    endtask


    task din(input i);
        begin
            @(negedge clk);
            d = i;
        end
    endtask

    initial begin

        clk   = 1'b0;
        reset = 1'b0;
        d= 1'b0;
        rst_dut;
        din(0);
        din(1);
        din(0);
        din(1);
        din(1);
        rst_dut;
        din(0);
        din(1);
        #20;
        $finish;
    end

    initial begin
      $monitor("tme=%0t | clk=%b reset=%b d=%b q=%b qb=%b",
                  $time, clk, reset, d, q, qb);
    end

endmodule
