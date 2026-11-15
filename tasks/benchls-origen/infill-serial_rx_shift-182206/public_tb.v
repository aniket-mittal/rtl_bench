// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_182206 dut (
    .Clk(clk),
    .Rst_n(in_vec[7:7]),
    .RxEn(in_vec[6:6]),
    .Rx(in_vec[5:5]),
    .Tick(in_vec[4:4]),
    .NBits(in_vec[3:0]),
    .RxDone(out_vec[8:8]),
    .RxData(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h2f;
    stim[1] = 8'h2e;
    stim[2] = 8'h90;
    stim[3] = 8'he5;
    stim[4] = 8'h9f;
    stim[5] = 8'h9f;
    stim[6] = 8'hd3;
    stim[7] = 8'hb9;
    stim[8] = 8'hc3;
    stim[9] = 8'h91;
    stim[10] = 8'h95;
    stim[11] = 8'hac;
    stim[12] = 8'hb4;
    stim[13] = 8'h9e;
    stim[14] = 8'hb6;
    stim[15] = 8'hf2;
    stim[16] = 8'hd1;
    stim[17] = 8'hb6;
    stim[18] = 8'hf1;
    stim[19] = 8'hde;
    stim[20] = 8'h9e;
    stim[21] = 8'hd4;
    stim[22] = 8'hfb;
    stim[23] = 8'hce;
    stim[24] = 8'hb8;
    stim[25] = 8'hf6;
    stim[26] = 8'h93;
    stim[27] = 8'hf9;
    stim[28] = 8'he7;
    stim[29] = 8'hfd;
    stim[30] = 8'hc4;
    stim[31] = 8'hbf;
    stim[32] = 8'hb9;
    stim[33] = 8'he8;
    stim[34] = 8'hdc;
    stim[35] = 8'h89;
    stim[36] = 8'hc6;
    stim[37] = 8'hac;
    stim[38] = 8'hcf;
    stim[39] = 8'haa;
    stim[40] = 8'hf5;
    stim[41] = 8'hee;
    stim[42] = 8'hdc;
    stim[43] = 8'hb4;
    stim[44] = 8'hb3;
    stim[45] = 8'he6;
    stim[46] = 8'hc9;
    stim[47] = 8'h93;
    stim[48] = 8'hd3;
    stim[49] = 8'h8b;
    stim[50] = 8'hb0;
    stim[51] = 8'hbb;
    stim[52] = 8'haa;
    stim[53] = 8'hbf;
    stim[54] = 8'h87;
    stim[55] = 8'ha6;
    stim[56] = 8'he0;
    stim[57] = 8'hc6;
    stim[58] = 8'h96;
    stim[59] = 8'h84;
    stim[60] = 8'h88;
    stim[61] = 8'hb3;
    stim[62] = 8'he9;
    stim[63] = 8'h8d;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h101;
      expv[14] = 9'h001;
      expv[15] = 9'h001;
      expv[16] = 9'h001;
      expv[17] = 9'h001;
      expv[18] = 9'h001;
      expv[19] = 9'h001;
      expv[20] = 9'h001;
      expv[21] = 9'h001;
      expv[22] = 9'h001;
      expv[23] = 9'h001;
      expv[24] = 9'h001;
      expv[25] = 9'h001;
      expv[26] = 9'h001;
      expv[27] = 9'h001;
      expv[28] = 9'h001;
      expv[29] = 9'h001;
      expv[30] = 9'h001;
      expv[31] = 9'h001;
      expv[32] = 9'h001;
      expv[33] = 9'h001;
      expv[34] = 9'h001;
      expv[35] = 9'h001;
      expv[36] = 9'h001;
      expv[37] = 9'h001;
      expv[38] = 9'h001;
      expv[39] = 9'h001;
      expv[40] = 9'h001;
      expv[41] = 9'h001;
      expv[42] = 9'h001;
      expv[43] = 9'h001;
      expv[44] = 9'h001;
      expv[45] = 9'h001;
      expv[46] = 9'h001;
      expv[47] = 9'h001;
      expv[48] = 9'h1e3;
      expv[49] = 9'h0e3;
      expv[50] = 9'h0e3;
      expv[51] = 9'h0e3;
      expv[52] = 9'h0e3;
      expv[53] = 9'h0e3;
      expv[54] = 9'h0e3;
      expv[55] = 9'h0e3;
      expv[56] = 9'h0e3;
      expv[57] = 9'h0e3;
      expv[58] = 9'h0e3;
      expv[59] = 9'h0e3;
      expv[60] = 9'h0e3;
      expv[61] = 9'h0e3;
      expv[62] = 9'h0e3;
      expv[63] = 9'h0e3;
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
