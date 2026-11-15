// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09114 dut (
    .CLK(clk),
    .CE(in_vec[9:9]),
    .process_input(in_vec[8:0]),
    .process_output(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h05f;
    stim[1] = 10'h105;
    stim[2] = 10'h30f;
    stim[3] = 10'h13d;
    stim[4] = 10'h04c;
    stim[5] = 10'h0aa;
    stim[6] = 10'h070;
    stim[7] = 10'h1c0;
    stim[8] = 10'h311;
    stim[9] = 10'h267;
    stim[10] = 10'h244;
    stim[11] = 10'h02b;
    stim[12] = 10'h14a;
    stim[13] = 10'h074;
    stim[14] = 10'h1b3;
    stim[15] = 10'h0fd;
    stim[16] = 10'h33f;
    stim[17] = 10'h225;
    stim[18] = 10'h01c;
    stim[19] = 10'h0ab;
    stim[20] = 10'h3c3;
    stim[21] = 10'h30c;
    stim[22] = 10'h3ce;
    stim[23] = 10'h3ca;
    stim[24] = 10'h3f8;
    stim[25] = 10'h39c;
    stim[26] = 10'h103;
    stim[27] = 10'h2d7;
    stim[28] = 10'h389;
    stim[29] = 10'h229;
    stim[30] = 10'h29b;
    stim[31] = 10'h089;
    stim[32] = 10'h269;
    stim[33] = 10'h25f;
    stim[34] = 10'h028;
    stim[35] = 10'h0f0;
    stim[36] = 10'h1ce;
    stim[37] = 10'h062;
    stim[38] = 10'h1bc;
    stim[39] = 10'h0ee;
    stim[40] = 10'h36e;
    stim[41] = 10'h258;
    stim[42] = 10'h2ef;
    stim[43] = 10'h01d;
    stim[44] = 10'h353;
    stim[45] = 10'h323;
    stim[46] = 10'h136;
    stim[47] = 10'h304;
    stim[48] = 10'h0a8;
    stim[49] = 10'h35a;
    stim[50] = 10'h0cb;
    stim[51] = 10'h0f1;
    stim[52] = 10'h031;
    stim[53] = 10'h0ce;
    stim[54] = 10'h3f4;
    stim[55] = 10'h13c;
    stim[56] = 10'h258;
    stim[57] = 10'h26d;
    stim[58] = 10'h10d;
    stim[59] = 10'h323;
    stim[60] = 10'h15a;
    stim[61] = 10'h068;
    stim[62] = 10'h0f5;
    stim[63] = 10'h3bf;
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
      expv[0] = 8'h5f;
      expv[1] = 8'h06;
      expv[2] = 8'h10;
      expv[3] = 8'h3e;
      expv[4] = 8'h4c;
      expv[5] = 8'haa;
      expv[6] = 8'h70;
      expv[7] = 8'hc1;
      expv[8] = 8'h12;
      expv[9] = 8'h67;
      expv[10] = 8'h44;
      expv[11] = 8'h2b;
      expv[12] = 8'h4b;
      expv[13] = 8'h74;
      expv[14] = 8'hb4;
      expv[15] = 8'hfd;
      expv[16] = 8'h40;
      expv[17] = 8'h25;
      expv[18] = 8'h1c;
      expv[19] = 8'hab;
      expv[20] = 8'hc4;
      expv[21] = 8'h0d;
      expv[22] = 8'hcf;
      expv[23] = 8'hcb;
      expv[24] = 8'hf9;
      expv[25] = 8'h9d;
      expv[26] = 8'h04;
      expv[27] = 8'hd7;
      expv[28] = 8'h8a;
      expv[29] = 8'h29;
      expv[30] = 8'h9b;
      expv[31] = 8'h89;
      expv[32] = 8'h69;
      expv[33] = 8'h5f;
      expv[34] = 8'h28;
      expv[35] = 8'hf0;
      expv[36] = 8'hcf;
      expv[37] = 8'h62;
      expv[38] = 8'hbd;
      expv[39] = 8'hee;
      expv[40] = 8'h6f;
      expv[41] = 8'h58;
      expv[42] = 8'hef;
      expv[43] = 8'h1d;
      expv[44] = 8'h54;
      expv[45] = 8'h24;
      expv[46] = 8'h37;
      expv[47] = 8'h05;
      expv[48] = 8'ha8;
      expv[49] = 8'h5b;
      expv[50] = 8'hcb;
      expv[51] = 8'hf1;
      expv[52] = 8'h31;
      expv[53] = 8'hce;
      expv[54] = 8'hf5;
      expv[55] = 8'h3d;
      expv[56] = 8'h58;
      expv[57] = 8'h6d;
      expv[58] = 8'h0e;
      expv[59] = 8'h24;
      expv[60] = 8'h5b;
      expv[61] = 8'h68;
      expv[62] = 8'hf5;
      expv[63] = 8'hc0;
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
