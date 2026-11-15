// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_023440 dut (
    .CC_MUX_registro_InBUS(in_vec[11:7]),
    .CC_MUX_control_InBUS(in_vec[6:1]),
    .CC_MUX_selector_InBUS(in_vec[0:0]),
    .CC_MUX_data_OutBUS(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hf94;
    stim[1] = 12'hfa3;
    stim[2] = 12'h9bf;
    stim[3] = 12'h5c3;
    stim[4] = 12'hd2b;
    stim[5] = 12'hfa9;
    stim[6] = 12'h7eb;
    stim[7] = 12'h88d;
    stim[8] = 12'h606;
    stim[9] = 12'h83f;
    stim[10] = 12'h3d3;
    stim[11] = 12'hd6f;
    stim[12] = 12'hbe3;
    stim[13] = 12'hf02;
    stim[14] = 12'h694;
    stim[15] = 12'h3eb;
    stim[16] = 12'h955;
    stim[17] = 12'hdfe;
    stim[18] = 12'h52f;
    stim[19] = 12'hfa1;
    stim[20] = 12'h1de;
    stim[21] = 12'hba4;
    stim[22] = 12'ha6f;
    stim[23] = 12'h88c;
    stim[24] = 12'hee5;
    stim[25] = 12'hee6;
    stim[26] = 12'h550;
    stim[27] = 12'hd92;
    stim[28] = 12'h02a;
    stim[29] = 12'h3b5;
    stim[30] = 12'he74;
    stim[31] = 12'h4b0;
    stim[32] = 12'h2a0;
    stim[33] = 12'h2b6;
    stim[34] = 12'h6be;
    stim[35] = 12'hff4;
    stim[36] = 12'h317;
    stim[37] = 12'h28c;
    stim[38] = 12'h9c3;
    stim[39] = 12'h517;
    stim[40] = 12'hc0e;
    stim[41] = 12'h4bc;
    stim[42] = 12'hcf5;
    stim[43] = 12'h835;
    stim[44] = 12'h940;
    stim[45] = 12'hc47;
    stim[46] = 12'h326;
    stim[47] = 12'hdeb;
    stim[48] = 12'hf64;
    stim[49] = 12'h96e;
    stim[50] = 12'h2ad;
    stim[51] = 12'h0ce;
    stim[52] = 12'h329;
    stim[53] = 12'h970;
    stim[54] = 12'hc21;
    stim[55] = 12'h3c4;
    stim[56] = 12'h508;
    stim[57] = 12'ha58;
    stim[58] = 12'hbad;
    stim[59] = 12'h0c4;
    stim[60] = 12'h734;
    stim[61] = 12'hc21;
    stim[62] = 12'hc45;
    stim[63] = 12'h519;
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
      expv[0] = 4'ha;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'hb;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h3;
      expv[9] = 4'h0;
      expv[10] = 4'h7;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h1;
      expv[14] = 4'ha;
      expv[15] = 4'h7;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'ha;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h6;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h0;
      expv[27] = 4'h9;
      expv[28] = 4'h0;
      expv[29] = 4'h7;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h6;
      expv[37] = 4'h6;
      expv[38] = 4'h0;
      expv[39] = 4'ha;
      expv[40] = 4'h7;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h0;
      expv[50] = 4'h5;
      expv[51] = 4'h0;
      expv[52] = 4'h6;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h4;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h0;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h0;
      expv[63] = 4'ha;
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
