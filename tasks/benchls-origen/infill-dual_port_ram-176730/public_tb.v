// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_176730 dut (
    .wclk(clk),
    .wdata(in_vec[28:21]),
    .waddr(in_vec[20:12]),
    .raddr(in_vec[11:3]),
    .we(in_vec[2:2]),
    .re(in_vec[1:1]),
    .rclk(in_vec[0:0]),
    .rdata(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h0827171d;
    stim[1] = 29'h056fcd3d;
    stim[2] = 29'h0868f58d;
    stim[3] = 29'h03fbd661;
    stim[4] = 29'h04b38024;
    stim[5] = 29'h00a7981c;
    stim[6] = 29'h08e7d3b9;
    stim[7] = 29'h0cd915da;
    stim[8] = 29'h08725109;
    stim[9] = 29'h0498c5fc;
    stim[10] = 29'h0e79c533;
    stim[11] = 29'h02f7c2fb;
    stim[12] = 29'h034aed15;
    stim[13] = 29'h1ffb43c9;
    stim[14] = 29'h150e3855;
    stim[15] = 29'h054495c0;
    stim[16] = 29'h0034439c;
    stim[17] = 29'h19e98f5e;
    stim[18] = 29'h122829ad;
    stim[19] = 29'h1057b283;
    stim[20] = 29'h1122a5f9;
    stim[21] = 29'h0c04ea07;
    stim[22] = 29'h054119f6;
    stim[23] = 29'h0c9aad8c;
    stim[24] = 29'h183732b9;
    stim[25] = 29'h018aefa2;
    stim[26] = 29'h12ee4f23;
    stim[27] = 29'h0b45cd4b;
    stim[28] = 29'h0446c82c;
    stim[29] = 29'h0a315acf;
    stim[30] = 29'h1100b8dc;
    stim[31] = 29'h15943984;
    stim[32] = 29'h10ab4361;
    stim[33] = 29'h0b4d8870;
    stim[34] = 29'h01defc2f;
    stim[35] = 29'h1567c42d;
    stim[36] = 29'h0b40a415;
    stim[37] = 29'h14c5661a;
    stim[38] = 29'h1d355206;
    stim[39] = 29'h003895e2;
    stim[40] = 29'h0e1680c3;
    stim[41] = 29'h103d688c;
    stim[42] = 29'h1c300f3c;
    stim[43] = 29'h17efbafd;
    stim[44] = 29'h07904111;
    stim[45] = 29'h18b9dd33;
    stim[46] = 29'h0bf49475;
    stim[47] = 29'h1bf6518f;
    stim[48] = 29'h111df2ee;
    stim[49] = 29'h07e5d9b0;
    stim[50] = 29'h073906b1;
    stim[51] = 29'h09ffe9a4;
    stim[52] = 29'h1a060bad;
    stim[53] = 29'h026d72d4;
    stim[54] = 29'h122f98f7;
    stim[55] = 29'h14afac5f;
    stim[56] = 29'h0d2ac372;
    stim[57] = 29'h00801baf;
    stim[58] = 29'h114e546d;
    stim[59] = 29'h046f03fa;
    stim[60] = 29'h064ad354;
    stim[61] = 29'h1b604d3e;
    stim[62] = 29'h05cfe7db;
    stim[63] = 29'h18bf6eeb;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hxx;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'hxx;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'hxx;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'hxx;
      expv[55] = 8'hxx;
      expv[56] = 8'hxx;
      expv[57] = 8'hxx;
      expv[58] = 8'hxx;
      expv[59] = 8'hxx;
      expv[60] = 8'hxx;
      expv[61] = 8'hxx;
      expv[62] = 8'hbf;
      expv[63] = 8'hbf;
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
