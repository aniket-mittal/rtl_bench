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

  gf_mult_by_ea dut (
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
    stim[0] = 8'h8b;
    stim[1] = 8'h78;
    stim[2] = 8'h48;
    stim[3] = 8'hea;
    stim[4] = 8'hcf;
    stim[5] = 8'h99;
    stim[6] = 8'hcd;
    stim[7] = 8'haa;
    stim[8] = 8'h92;
    stim[9] = 8'h3c;
    stim[10] = 8'h82;
    stim[11] = 8'h98;
    stim[12] = 8'h9a;
    stim[13] = 8'h81;
    stim[14] = 8'h8e;
    stim[15] = 8'h8a;
    stim[16] = 8'ha4;
    stim[17] = 8'he2;
    stim[18] = 8'h9e;
    stim[19] = 8'hfb;
    stim[20] = 8'h2a;
    stim[21] = 8'h20;
    stim[22] = 8'hea;
    stim[23] = 8'h67;
    stim[24] = 8'h8f;
    stim[25] = 8'h27;
    stim[26] = 8'h92;
    stim[27] = 8'h03;
    stim[28] = 8'h11;
    stim[29] = 8'hf3;
    stim[30] = 8'h98;
    stim[31] = 8'h35;
    stim[32] = 8'h79;
    stim[33] = 8'h0e;
    stim[34] = 8'h34;
    stim[35] = 8'hf9;
    stim[36] = 8'h6b;
    stim[37] = 8'h0d;
    stim[38] = 8'h1f;
    stim[39] = 8'h04;
    stim[40] = 8'hf1;
    stim[41] = 8'ha9;
    stim[42] = 8'h46;
    stim[43] = 8'he7;
    stim[44] = 8'hf0;
    stim[45] = 8'hcb;
    stim[46] = 8'h39;
    stim[47] = 8'h46;
    stim[48] = 8'h44;
    stim[49] = 8'h12;
    stim[50] = 8'h0b;
    stim[51] = 8'hc3;
    stim[52] = 8'h44;
    stim[53] = 8'h16;
    stim[54] = 8'h9d;
    stim[55] = 8'hfc;
    stim[56] = 8'h21;
    stim[57] = 8'h45;
    stim[58] = 8'h13;
    stim[59] = 8'h0f;
    stim[60] = 8'h00;
    stim[61] = 8'hce;
    stim[62] = 8'hf6;
    stim[63] = 8'h1e;
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
      expv[0] = 8'h10;
      expv[1] = 8'h11;
      expv[2] = 8'h1b;
      expv[3] = 8'hee;
      expv[4] = 8'h87;
      expv[5] = 8'hdf;
      expv[6] = 8'h4e;
      expv[7] = 8'hf6;
      expv[8] = 8'hff;
      expv[9] = 8'h86;
      expv[10] = 8'hf9;
      expv[11] = 8'h35;
      expv[12] = 8'hfc;
      expv[13] = 8'hda;
      expv[14] = 8'h75;
      expv[15] = 8'hfa;
      expv[16] = 8'hb3;
      expv[17] = 8'hed;
      expv[18] = 8'h73;
      expv[19] = 8'h02;
      expv[20] = 8'hc6;
      expv[21] = 8'h0c;
      expv[22] = 8'hee;
      expv[23] = 8'hb8;
      expv[24] = 8'h9f;
      expv[25] = 8'ha0;
      expv[26] = 8'hff;
      expv[27] = 8'h23;
      expv[28] = 8'hec;
      expv[29] = 8'h01;
      expv[30] = 8'h35;
      expv[31] = 8'h6f;
      expv[32] = 8'hfb;
      expv[33] = 8'h45;
      expv[34] = 8'h85;
      expv[35] = 8'hcb;
      expv[36] = 8'h34;
      expv[37] = 8'h66;
      expv[38] = 8'ha9;
      expv[39] = 8'h8f;
      expv[40] = 8'hc8;
      expv[41] = 8'hd5;
      expv[42] = 8'h5e;
      expv[43] = 8'h88;
      expv[44] = 8'h22;
      expv[45] = 8'h08;
      expv[46] = 8'he3;
      expv[47] = 8'h5e;
      expv[48] = 8'h97;
      expv[49] = 8'hcf;
      expv[50] = 8'h20;
      expv[51] = 8'h0b;
      expv[52] = 8'h97;
      expv[53] = 8'h40;
      expv[54] = 8'h50;
      expv[55] = 8'hae;
      expv[56] = 8'he6;
      expv[57] = 8'h7d;
      expv[58] = 8'h25;
      expv[59] = 8'haf;
      expv[60] = 8'h00;
      expv[61] = 8'h6d;
      expv[62] = 8'h64;
      expv[63] = 8'h43;
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
