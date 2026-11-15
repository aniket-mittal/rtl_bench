// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gf_mult_by_9d dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hee;
    stim[1] = 8'h04;
    stim[2] = 8'hf2;
    stim[3] = 8'h31;
    stim[4] = 8'hf1;
    stim[5] = 8'h66;
    stim[6] = 8'hc5;
    stim[7] = 8'h37;
    stim[8] = 8'h03;
    stim[9] = 8'h1a;
    stim[10] = 8'hba;
    stim[11] = 8'hd8;
    stim[12] = 8'h3b;
    stim[13] = 8'h0c;
    stim[14] = 8'hea;
    stim[15] = 8'h88;
    stim[16] = 8'h3c;
    stim[17] = 8'ha1;
    stim[18] = 8'h61;
    stim[19] = 8'hb1;
    stim[20] = 8'hfe;
    stim[21] = 8'h2c;
    stim[22] = 8'h31;
    stim[23] = 8'h5b;
    stim[24] = 8'h08;
    stim[25] = 8'h7d;
    stim[26] = 8'hcd;
    stim[27] = 8'ha1;
    stim[28] = 8'h19;
    stim[29] = 8'hfb;
    stim[30] = 8'hc1;
    stim[31] = 8'h86;
    stim[32] = 8'hb7;
    stim[33] = 8'h09;
    stim[34] = 8'ha2;
    stim[35] = 8'hf3;
    stim[36] = 8'hdd;
    stim[37] = 8'h09;
    stim[38] = 8'h46;
    stim[39] = 8'h92;
    stim[40] = 8'ha9;
    stim[41] = 8'h87;
    stim[42] = 8'h75;
    stim[43] = 8'h2d;
    stim[44] = 8'h1a;
    stim[45] = 8'h80;
    stim[46] = 8'h94;
    stim[47] = 8'hf8;
    stim[48] = 8'ha6;
    stim[49] = 8'hef;
    stim[50] = 8'h12;
    stim[51] = 8'h13;
    stim[52] = 8'hb1;
    stim[53] = 8'h5b;
    stim[54] = 8'he3;
    stim[55] = 8'h63;
    stim[56] = 8'h00;
    stim[57] = 8'h78;
    stim[58] = 8'hd0;
    stim[59] = 8'h51;
    stim[60] = 8'h3c;
    stim[61] = 8'h88;
    stim[62] = 8'h54;
    stim[63] = 8'hf8;
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
      expv[0] = 8'h1e;
      expv[1] = 8'h4e;
      expv[2] = 8'he9;
      expv[3] = 8'hf2;
      expv[4] = 8'h53;
      expv[5] = 8'hb7;
      expv[6] = 8'h72;
      expv[7] = 8'h9b;
      expv[8] = 8'hba;
      expv[9] = 8'h9e;
      expv[10] = 8'he1;
      expv[11] = 8'h18;
      expv[12] = 8'h49;
      expv[13] = 8'hd2;
      expv[14] = 8'h50;
      expv[15] = 8'ha9;
      expv[16] = 8'hbd;
      expv[17] = 8'he2;
      expv[18] = 8'h43;
      expv[19] = 8'hc7;
      expv[20] = 8'h3b;
      expv[21] = 8'h98;
      expv[22] = 8'hf2;
      expv[23] = 8'h97;
      expv[24] = 8'h9c;
      expv[25] = 8'hb4;
      expv[26] = 8'hee;
      expv[27] = 8'he2;
      expv[28] = 8'h24;
      expv[29] = 8'he8;
      expv[30] = 8'h3c;
      expv[31] = 8'h5c;
      expv[32] = 8'hae;
      expv[33] = 8'h01;
      expv[34] = 8'h58;
      expv[35] = 8'h74;
      expv[36] = 8'hcb;
      expv[37] = 8'h01;
      expv[38] = 8'hfd;
      expv[39] = 8'h37;
      expv[40] = 8'h7e;
      expv[41] = 8'hc1;
      expv[42] = 8'h28;
      expv[43] = 8'h05;
      expv[44] = 8'h9e;
      expv[45] = 8'h35;
      expv[46] = 8'h5e;
      expv[47] = 8'h52;
      expv[48] = 8'h16;
      expv[49] = 8'h83;
      expv[50] = 8'h02;
      expv[51] = 8'h9f;
      expv[52] = 8'hc7;
      expv[53] = 8'h97;
      expv[54] = 8'h51;
      expv[55] = 8'h64;
      expv[56] = 8'h00;
      expv[57] = 8'h67;
      expv[58] = 8'h84;
      expv[59] = 8'h2c;
      expv[60] = 8'hbd;
      expv[61] = 8'ha9;
      expv[62] = 8'hff;
      expv[63] = 8'h52;
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
