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

  gf_mult_by_c9 dut (
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
    stim[0] = 8'h6d;
    stim[1] = 8'hf6;
    stim[2] = 8'hb3;
    stim[3] = 8'h8e;
    stim[4] = 8'h44;
    stim[5] = 8'h3f;
    stim[6] = 8'h4e;
    stim[7] = 8'h91;
    stim[8] = 8'h2c;
    stim[9] = 8'h0d;
    stim[10] = 8'h15;
    stim[11] = 8'heb;
    stim[12] = 8'hf1;
    stim[13] = 8'hc7;
    stim[14] = 8'hcb;
    stim[15] = 8'h66;
    stim[16] = 8'hee;
    stim[17] = 8'hd4;
    stim[18] = 8'h9a;
    stim[19] = 8'h21;
    stim[20] = 8'h53;
    stim[21] = 8'hbd;
    stim[22] = 8'h9e;
    stim[23] = 8'h9e;
    stim[24] = 8'h63;
    stim[25] = 8'hea;
    stim[26] = 8'hc1;
    stim[27] = 8'h95;
    stim[28] = 8'h71;
    stim[29] = 8'h20;
    stim[30] = 8'h2d;
    stim[31] = 8'h1f;
    stim[32] = 8'h6f;
    stim[33] = 8'he5;
    stim[34] = 8'hd6;
    stim[35] = 8'he6;
    stim[36] = 8'hf5;
    stim[37] = 8'h92;
    stim[38] = 8'hd2;
    stim[39] = 8'h6a;
    stim[40] = 8'hda;
    stim[41] = 8'hdc;
    stim[42] = 8'ha2;
    stim[43] = 8'h61;
    stim[44] = 8'h88;
    stim[45] = 8'h18;
    stim[46] = 8'h10;
    stim[47] = 8'h63;
    stim[48] = 8'hc3;
    stim[49] = 8'he0;
    stim[50] = 8'hf2;
    stim[51] = 8'h78;
    stim[52] = 8'hb1;
    stim[53] = 8'h84;
    stim[54] = 8'h8c;
    stim[55] = 8'h49;
    stim[56] = 8'h4d;
    stim[57] = 8'h6d;
    stim[58] = 8'hb5;
    stim[59] = 8'hb1;
    stim[60] = 8'h00;
    stim[61] = 8'ha7;
    stim[62] = 8'h9e;
    stim[63] = 8'h22;
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
      expv[0] = 8'he4;
      expv[1] = 8'hc8;
      expv[2] = 8'h32;
      expv[3] = 8'hea;
      expv[4] = 8'h33;
      expv[5] = 8'h57;
      expv[6] = 8'hba;
      expv[7] = 8'ha5;
      expv[8] = 8'h1d;
      expv[9] = 8'hcc;
      expv[10] = 8'hc6;
      expv[11] = 8'h08;
      expv[12] = 8'h8d;
      expv[13] = 8'h15;
      expv[14] = 8'h10;
      expv[15] = 8'ha4;
      expv[16] = 8'hc2;
      expv[17] = 8'h5f;
      expv[18] = 8'he5;
      expv[19] = 8'hd1;
      expv[20] = 8'h7a;
      expv[21] = 8'hb8;
      expv[22] = 8'he6;
      expv[23] = 8'he6;
      expv[24] = 8'h6e;
      expv[25] = 8'hc1;
      expv[26] = 8'h99;
      expv[27] = 8'ha6;
      expv[28] = 8'hed;
      expv[29] = 8'h18;
      expv[30] = 8'hd4;
      expv[31] = 8'h4f;
      expv[32] = 8'h6b;
      expv[33] = 8'h82;
      expv[34] = 8'hd0;
      expv[35] = 8'hc4;
      expv[36] = 8'h8e;
      expv[37] = 8'he3;
      expv[38] = 8'hd3;
      expv[39] = 8'ha1;
      expv[40] = 8'hd5;
      expv[41] = 8'h59;
      expv[42] = 8'hf7;
      expv[43] = 8'he1;
      expv[44] = 8'h66;
      expv[45] = 8'h0a;
      expv[46] = 8'h0c;
      expv[47] = 8'h6e;
      expv[48] = 8'h16;
      expv[49] = 8'h48;
      expv[50] = 8'hcb;
      expv[51] = 8'h22;
      expv[52] = 8'hbd;
      expv[53] = 8'h63;
      expv[54] = 8'h65;
      expv[55] = 8'hff;
      expv[56] = 8'hfc;
      expv[57] = 8'he4;
      expv[58] = 8'hbe;
      expv[59] = 8'hbd;
      expv[60] = 8'h00;
      expv[61] = 8'h3d;
      expv[62] = 8'he6;
      expv[63] = 8'h97;
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
