// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_117648 dut (
    .o(in_vec[31:16]),
    .x(in_vec[15:0]),
    .tlog(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hd02945da;
    stim[1] = 32'h8913cf2a;
    stim[2] = 32'hd502f48b;
    stim[3] = 32'hd1afb6f2;
    stim[4] = 32'hce07573c;
    stim[5] = 32'hf832bbb2;
    stim[6] = 32'h578f096d;
    stim[7] = 32'h86c4a750;
    stim[8] = 32'h4af19b4f;
    stim[9] = 32'h7a58b122;
    stim[10] = 32'h154a4d5a;
    stim[11] = 32'h57cf0e2d;
    stim[12] = 32'heb008170;
    stim[13] = 32'hb295a83c;
    stim[14] = 32'h2cfdbda6;
    stim[15] = 32'hd9f692a6;
    stim[16] = 32'h9abddf5c;
    stim[17] = 32'h5974b5b7;
    stim[18] = 32'hdd68bfa7;
    stim[19] = 32'hd600182f;
    stim[20] = 32'he6515142;
    stim[21] = 32'h6e719c94;
    stim[22] = 32'hdb515e63;
    stim[23] = 32'hb71594cb;
    stim[24] = 32'h3eb4ccb8;
    stim[25] = 32'h4e30a57b;
    stim[26] = 32'hbdb7402c;
    stim[27] = 32'h503e00fe;
    stim[28] = 32'ha6c2733b;
    stim[29] = 32'h6b8de949;
    stim[30] = 32'h0a9cd944;
    stim[31] = 32'he3885ac6;
    stim[32] = 32'h814fe627;
    stim[33] = 32'hbbf390fa;
    stim[34] = 32'hef5a6122;
    stim[35] = 32'h31f2a28b;
    stim[36] = 32'hf1ad7787;
    stim[37] = 32'h57770d8c;
    stim[38] = 32'h8af50991;
    stim[39] = 32'h9a7b4fda;
    stim[40] = 32'h83bcfe2e;
    stim[41] = 32'h3f81820a;
    stim[42] = 32'h2e01b7c3;
    stim[43] = 32'h7f00d624;
    stim[44] = 32'he26349a1;
    stim[45] = 32'h4198ae2d;
    stim[46] = 32'ha93715f9;
    stim[47] = 32'h88c83d60;
    stim[48] = 32'h124938b9;
    stim[49] = 32'h8be5ee9a;
    stim[50] = 32'h8c5cbbda;
    stim[51] = 32'h9b0324c2;
    stim[52] = 32'h27b84259;
    stim[53] = 32'h3f39136d;
    stim[54] = 32'h06d690f6;
    stim[55] = 32'h0e7283cd;
    stim[56] = 32'heb8512e7;
    stim[57] = 32'h19fd7b5d;
    stim[58] = 32'he36bef5a;
    stim[59] = 32'hce417e8c;
    stim[60] = 32'h5ca8321f;
    stim[61] = 32'h344be2fc;
    stim[62] = 32'h208726a0;
    stim[63] = 32'hb79cbebe;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 15'h0000;
      expv[1] = 15'h0000;
      expv[2] = 15'h0000;
      expv[3] = 15'h0000;
      expv[4] = 15'h0000;
      expv[5] = 15'h0000;
      expv[6] = 15'h0000;
      expv[7] = 15'h0000;
      expv[8] = 15'h0000;
      expv[9] = 15'h0000;
      expv[10] = 15'h0000;
      expv[11] = 15'h0000;
      expv[12] = 15'h0000;
      expv[13] = 15'h0000;
      expv[14] = 15'h0000;
      expv[15] = 15'h0000;
      expv[16] = 15'h0000;
      expv[17] = 15'h0000;
      expv[18] = 15'h0000;
      expv[19] = 15'h0000;
      expv[20] = 15'h0000;
      expv[21] = 15'h0000;
      expv[22] = 15'h0000;
      expv[23] = 15'h0000;
      expv[24] = 15'h0000;
      expv[25] = 15'h0000;
      expv[26] = 15'h0000;
      expv[27] = 15'h0000;
      expv[28] = 15'h0000;
      expv[29] = 15'h0000;
      expv[30] = 15'h0000;
      expv[31] = 15'h0000;
      expv[32] = 15'h0000;
      expv[33] = 15'h0000;
      expv[34] = 15'h0000;
      expv[35] = 15'h0000;
      expv[36] = 15'h0000;
      expv[37] = 15'h0000;
      expv[38] = 15'h0000;
      expv[39] = 15'h0000;
      expv[40] = 15'h0000;
      expv[41] = 15'h0000;
      expv[42] = 15'h0000;
      expv[43] = 15'h0000;
      expv[44] = 15'h0000;
      expv[45] = 15'h0000;
      expv[46] = 15'h0000;
      expv[47] = 15'h0000;
      expv[48] = 15'h0000;
      expv[49] = 15'h0000;
      expv[50] = 15'h0000;
      expv[51] = 15'h0000;
      expv[52] = 15'h0000;
      expv[53] = 15'h0000;
      expv[54] = 15'h0000;
      expv[55] = 15'h0000;
      expv[56] = 15'h0000;
      expv[57] = 15'h0000;
      expv[58] = 15'h0000;
      expv[59] = 15'h0000;
      expv[60] = 15'h0000;
      expv[61] = 15'h0000;
      expv[62] = 15'h0000;
      expv[63] = 15'h0000;
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
