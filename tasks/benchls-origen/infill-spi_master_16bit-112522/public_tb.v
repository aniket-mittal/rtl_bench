// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_112522 dut (
    .clk(clk),
    .rst_n(in_vec[18:18]),
    .wrt(in_vec[17:17]),
    .cmd(in_vec[16:1]),
    .MISO(in_vec[0:0]),
    .done(out_vec[19:19]),
    .SS_n(out_vec[18:18]),
    .SCLK(out_vec[17:17]),
    .MOSI(out_vec[16:16]),
    .rd_data(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h1eb50;
    stim[1] = 19'h3d83d;
    stim[2] = 19'h77d2f;
    stim[3] = 19'h648f5;
    stim[4] = 19'h7e257;
    stim[5] = 19'h44f0d;
    stim[6] = 19'h47765;
    stim[7] = 19'h77f5b;
    stim[8] = 19'h7a773;
    stim[9] = 19'h6af32;
    stim[10] = 19'h54c72;
    stim[11] = 19'h6eeae;
    stim[12] = 19'h6fc3c;
    stim[13] = 19'h442c1;
    stim[14] = 19'h6f7bf;
    stim[15] = 19'h79d18;
    stim[16] = 19'h62cb3;
    stim[17] = 19'h60852;
    stim[18] = 19'h45e26;
    stim[19] = 19'h4f214;
    stim[20] = 19'h69b56;
    stim[21] = 19'h452f7;
    stim[22] = 19'h5465d;
    stim[23] = 19'h5bdfa;
    stim[24] = 19'h6e92e;
    stim[25] = 19'h58819;
    stim[26] = 19'h40c2c;
    stim[27] = 19'h4b7fe;
    stim[28] = 19'h6c300;
    stim[29] = 19'h61430;
    stim[30] = 19'h6203e;
    stim[31] = 19'h34151;
    stim[32] = 19'h79c77;
    stim[33] = 19'h5406a;
    stim[34] = 19'h7ea3b;
    stim[35] = 19'h5b32b;
    stim[36] = 19'h41789;
    stim[37] = 19'h79003;
    stim[38] = 19'h679b1;
    stim[39] = 19'h49e7d;
    stim[40] = 19'h56428;
    stim[41] = 19'h5e09f;
    stim[42] = 19'h4df32;
    stim[43] = 19'h62684;
    stim[44] = 19'h4097c;
    stim[45] = 19'h60830;
    stim[46] = 19'h4fac6;
    stim[47] = 19'h4f541;
    stim[48] = 19'h140fd;
    stim[49] = 19'h75c6e;
    stim[50] = 19'h71223;
    stim[51] = 19'h55cde;
    stim[52] = 19'h62979;
    stim[53] = 19'h40bb1;
    stim[54] = 19'h64734;
    stim[55] = 19'h75efe;
    stim[56] = 19'h482b5;
    stim[57] = 19'h6abfb;
    stim[58] = 19'h5bce1;
    stim[59] = 19'h4b7c9;
    stim[60] = 19'h73460;
    stim[61] = 19'h44145;
    stim[62] = 19'h5ff48;
    stim[63] = 19'h62c50;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 20'hx0000;
      expv[1] = 20'h40000;
      expv[2] = 20'h40000;
      expv[3] = 20'h50000;
      expv[4] = 20'h10000;
      expv[5] = 20'h10000;
      expv[6] = 20'h10000;
      expv[7] = 20'h10000;
      expv[8] = 20'h10000;
      expv[9] = 20'h10000;
      expv[10] = 20'h10000;
      expv[11] = 20'h10000;
      expv[12] = 20'h10000;
      expv[13] = 20'h10000;
      expv[14] = 20'h10000;
      expv[15] = 20'h10000;
      expv[16] = 20'h10000;
      expv[17] = 20'h10000;
      expv[18] = 20'h10000;
      expv[19] = 20'h10000;
      expv[20] = 20'h10000;
      expv[21] = 20'h10000;
      expv[22] = 20'h10000;
      expv[23] = 20'h10000;
      expv[24] = 20'h10000;
      expv[25] = 20'h10000;
      expv[26] = 20'h10000;
      expv[27] = 20'h10000;
      expv[28] = 20'h10000;
      expv[29] = 20'h10000;
      expv[30] = 20'h10000;
      expv[31] = 20'h40000;
      expv[32] = 20'h40000;
      expv[33] = 20'h50000;
      expv[34] = 20'h10000;
      expv[35] = 20'h10000;
      expv[36] = 20'h10000;
      expv[37] = 20'h10000;
      expv[38] = 20'h10000;
      expv[39] = 20'h10000;
      expv[40] = 20'h10000;
      expv[41] = 20'h10000;
      expv[42] = 20'h10000;
      expv[43] = 20'h10000;
      expv[44] = 20'h10000;
      expv[45] = 20'h10000;
      expv[46] = 20'h10000;
      expv[47] = 20'h10000;
      expv[48] = 20'h40000;
      expv[49] = 20'h40000;
      expv[50] = 20'h50000;
      expv[51] = 20'h10000;
      expv[52] = 20'h10000;
      expv[53] = 20'h10000;
      expv[54] = 20'h10000;
      expv[55] = 20'h10000;
      expv[56] = 20'h10000;
      expv[57] = 20'h10000;
      expv[58] = 20'h10000;
      expv[59] = 20'h10000;
      expv[60] = 20'h10000;
      expv[61] = 20'h10000;
      expv[62] = 20'h10000;
      expv[63] = 20'h10000;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
