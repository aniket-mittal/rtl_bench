// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10141 dut (
    .clk(clk),
    .Data_AR(in_vec[35:20]),
    .Data_BR(in_vec[19:4]),
    .Ld_AR_BR(in_vec[3:3]),
    .Div_AR_x2_CR(in_vec[2:2]),
    .Mul_BR_x2_CR(in_vec[1:1]),
    .Clr_CR(in_vec[0:0]),
    .CR(out_vec[17:2]),
    .AR_gt_0(out_vec[1:1]),
    .AR_lt_0(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hd7ec9d777;
    stim[1] = 36'h2a7e1861b;
    stim[2] = 36'h4457f8b98;
    stim[3] = 36'h0b7382c94;
    stim[4] = 36'h3a2950aea;
    stim[5] = 36'h39265e084;
    stim[6] = 36'h64e60a377;
    stim[7] = 36'h5fa18fa1f;
    stim[8] = 36'h50d3df6cb;
    stim[9] = 36'h28341f508;
    stim[10] = 36'ha3b5057e7;
    stim[11] = 36'hf7f6b8334;
    stim[12] = 36'ha76014458;
    stim[13] = 36'hdfd21cfa1;
    stim[14] = 36'h8ad3ea3bc;
    stim[15] = 36'hd9b9f0a1e;
    stim[16] = 36'h5377f648d;
    stim[17] = 36'h9620f3451;
    stim[18] = 36'h0d9e9d4fc;
    stim[19] = 36'he6030abf0;
    stim[20] = 36'h881c40ab8;
    stim[21] = 36'h0bda0aa82;
    stim[22] = 36'h6e5b4c8a8;
    stim[23] = 36'h79cf06fe0;
    stim[24] = 36'h5132de20c;
    stim[25] = 36'he05c86fe1;
    stim[26] = 36'h81ba6ba19;
    stim[27] = 36'haf4a2e509;
    stim[28] = 36'h095e768f7;
    stim[29] = 36'h6de2947b2;
    stim[30] = 36'h09396ab9f;
    stim[31] = 36'h923697d82;
    stim[32] = 36'h33c842dad;
    stim[33] = 36'h7fe718c7b;
    stim[34] = 36'heb51ea3bb;
    stim[35] = 36'h82624cd25;
    stim[36] = 36'h0c009f25e;
    stim[37] = 36'h5186e199d;
    stim[38] = 36'h684cd5659;
    stim[39] = 36'h3d63bcdc3;
    stim[40] = 36'hf7b15f54a;
    stim[41] = 36'h284813986;
    stim[42] = 36'h267c04661;
    stim[43] = 36'h19e52cfae;
    stim[44] = 36'h56e8be30d;
    stim[45] = 36'he7af36f6e;
    stim[46] = 36'h1d5910f23;
    stim[47] = 36'h606cd1992;
    stim[48] = 36'h1f7888116;
    stim[49] = 36'h368802524;
    stim[50] = 36'h3d76a5615;
    stim[51] = 36'he34cc5970;
    stim[52] = 36'hdcd0842a2;
    stim[53] = 36'hbaa6f7170;
    stim[54] = 36'hfe6f3b446;
    stim[55] = 36'h9c5672c98;
    stim[56] = 36'h59307acaf;
    stim[57] = 36'h1de328740;
    stim[58] = 36'h6f200196d;
    stim[59] = 36'h4a6398157;
    stim[60] = 36'h2f9f2cc35;
    stim[61] = 36'h234726472;
    stim[62] = 36'h8caff1227;
    stim[63] = 36'h7aea4a884;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'hxxxxx;
      expv[2] = 18'hxxxxx;
      expv[3] = 18'hxxxxx;
      expv[4] = 18'h088ae;
      expv[5] = 18'h088ae;
      expv[6] = 18'h07452;
      expv[7] = 18'h07452;
      expv[8] = 18'h07452;
      expv[9] = 18'h07452;
      expv[10] = 18'h07452;
      expv[11] = 18'h0506a;
      expv[12] = 18'h0506a;
      expv[13] = 18'h05069;
      expv[14] = 18'h00001;
      expv[15] = 18'h00001;
      expv[16] = 18'h00001;
      expv[17] = 18'h00002;
      expv[18] = 18'h00002;
      expv[19] = 18'h00002;
      expv[20] = 18'h00002;
      expv[21] = 18'h00001;
      expv[22] = 18'h20559;
      expv[23] = 18'h2055a;
      expv[24] = 18'h2055a;
      expv[25] = 18'h2055a;
      expv[26] = 18'h00002;
      expv[27] = 18'h00001;
      expv[28] = 18'h00001;
      expv[29] = 18'h35e95;
      expv[30] = 18'h17281;
      expv[31] = 18'h17282;
      expv[32] = 18'h355ca;
      expv[33] = 18'h355ca;
      expv[34] = 18'h355ca;
      expv[35] = 18'h355c9;
      expv[36] = 18'h3d6a5;
      expv[37] = 18'h3d6a6;
      expv[38] = 18'h3d6a6;
      expv[39] = 18'h3d6a6;
      expv[40] = 18'h2ab2a;
      expv[41] = 18'h2ab29;
      expv[42] = 18'h3ef65;
      expv[43] = 18'h00001;
      expv[44] = 18'h00002;
      expv[45] = 18'h00002;
      expv[46] = 18'h00001;
      expv[47] = 18'h1b7b1;
      expv[48] = 18'h1b7b1;
      expv[49] = 18'h3cf61;
      expv[50] = 18'h3cf61;
      expv[51] = 18'h3cf61;
      expv[52] = 18'h3cf61;
      expv[53] = 18'h1b7b1;
      expv[54] = 18'h1b7b1;
      expv[55] = 18'h3cf61;
      expv[56] = 18'h3cf61;
      expv[57] = 18'h3cf62;
      expv[58] = 18'h3cf62;
      expv[59] = 18'h3cf62;
      expv[60] = 18'h0de42;
      expv[61] = 18'h0de42;
      expv[62] = 18'h00cb2;
      expv[63] = 18'h0de42;
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
