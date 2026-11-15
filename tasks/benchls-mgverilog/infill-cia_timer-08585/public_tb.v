// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08585 dut (
    .clk(clk),
    .clk7_en(in_vec[15:15]),
    .wr(in_vec[14:14]),
    .reset(in_vec[13:13]),
    .tlo(in_vec[12:12]),
    .thi(in_vec[11:11]),
    .tcr(in_vec[10:10]),
    .data_in(in_vec[9:2]),
    .eclk(in_vec[1:1]),
    .tmra_ovf(in_vec[0:0]),
    .data_out(out_vec[8:1]),
    .irq(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hae2f;
    stim[1] = 16'hfec5;
    stim[2] = 16'hda5c;
    stim[3] = 16'h0c5d;
    stim[4] = 16'h0863;
    stim[5] = 16'h1eb5;
    stim[6] = 16'h920a;
    stim[7] = 16'h1ab7;
    stim[8] = 16'h9496;
    stim[9] = 16'hceff;
    stim[10] = 16'h87f6;
    stim[11] = 16'h4a56;
    stim[12] = 16'hc155;
    stim[13] = 16'h49f7;
    stim[14] = 16'h0362;
    stim[15] = 16'h4784;
    stim[16] = 16'h5e2c;
    stim[17] = 16'h4b02;
    stim[18] = 16'h89d6;
    stim[19] = 16'hdaf7;
    stim[20] = 16'hdd21;
    stim[21] = 16'h5ccb;
    stim[22] = 16'hd5da;
    stim[23] = 16'h11d4;
    stim[24] = 16'h8c2e;
    stim[25] = 16'h91b0;
    stim[26] = 16'h1ad2;
    stim[27] = 16'h849e;
    stim[28] = 16'hc5f1;
    stim[29] = 16'h9602;
    stim[30] = 16'h10e4;
    stim[31] = 16'h54c3;
    stim[32] = 16'h11ce;
    stim[33] = 16'hce26;
    stim[34] = 16'hd63a;
    stim[35] = 16'h1f48;
    stim[36] = 16'h9d09;
    stim[37] = 16'h05c2;
    stim[38] = 16'hc28b;
    stim[39] = 16'hdbc8;
    stim[40] = 16'h536c;
    stim[41] = 16'h9ebb;
    stim[42] = 16'h0abe;
    stim[43] = 16'h5e6b;
    stim[44] = 16'h1c60;
    stim[45] = 16'h4d83;
    stim[46] = 16'h12ae;
    stim[47] = 16'h52e0;
    stim[48] = 16'hd7d9;
    stim[49] = 16'h18bc;
    stim[50] = 16'h0b6c;
    stim[51] = 16'h84ac;
    stim[52] = 16'h0452;
    stim[53] = 16'hc614;
    stim[54] = 16'h02cf;
    stim[55] = 16'h8098;
    stim[56] = 16'hcd53;
    stim[57] = 16'hd8bc;
    stim[58] = 16'hcbea;
    stim[59] = 16'h12b2;
    stim[60] = 16'h4cfe;
    stim[61] = 16'hd9af;
    stim[62] = 16'h1452;
    stim[63] = 16'h856d;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h1fe;
      expv[4] = 9'h1fe;
      expv[5] = 9'h1fe;
      expv[6] = 9'h1fe;
      expv[7] = 9'h12e;
      expv[8] = 9'h12e;
      expv[9] = 9'h000;
      expv[10] = 9'h05e;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h17e;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h090;
      expv[24] = 9'h0dc;
      expv[25] = 9'h0ec;
      expv[26] = 9'h0fc;
      expv[27] = 9'h0cc;
      expv[28] = 9'h000;
      expv[29] = 9'h0fc;
      expv[30] = 9'h0ec;
      expv[31] = 9'h000;
      expv[32] = 9'h0ec;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h1fe;
      expv[36] = 9'h1fe;
      expv[37] = 9'h01c;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h1fe;
      expv[42] = 9'h1e4;
      expv[43] = 9'h000;
      expv[44] = 9'h1fe;
      expv[45] = 9'h000;
      expv[46] = 9'h1e4;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h1e4;
      expv[50] = 9'h1e4;
      expv[51] = 9'h0cc;
      expv[52] = 9'h0cc;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h05e;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h0de;
      expv[63] = 9'h088;
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
