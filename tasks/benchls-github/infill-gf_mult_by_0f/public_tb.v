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

  gf_mult_by_0f dut (
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
    stim[1] = 8'h63;
    stim[2] = 8'ha2;
    stim[3] = 8'h92;
    stim[4] = 8'h17;
    stim[5] = 8'he2;
    stim[6] = 8'he1;
    stim[7] = 8'he6;
    stim[8] = 8'h11;
    stim[9] = 8'hcb;
    stim[10] = 8'hfa;
    stim[11] = 8'hed;
    stim[12] = 8'h40;
    stim[13] = 8'h8f;
    stim[14] = 8'h8c;
    stim[15] = 8'he5;
    stim[16] = 8'hbd;
    stim[17] = 8'haa;
    stim[18] = 8'hf7;
    stim[19] = 8'hab;
    stim[20] = 8'h42;
    stim[21] = 8'hfc;
    stim[22] = 8'hf9;
    stim[23] = 8'h73;
    stim[24] = 8'hd3;
    stim[25] = 8'h65;
    stim[26] = 8'h34;
    stim[27] = 8'ha9;
    stim[28] = 8'hff;
    stim[29] = 8'h16;
    stim[30] = 8'h74;
    stim[31] = 8'h3e;
    stim[32] = 8'h90;
    stim[33] = 8'h1c;
    stim[34] = 8'hf9;
    stim[35] = 8'h66;
    stim[36] = 8'h1f;
    stim[37] = 8'h37;
    stim[38] = 8'h85;
    stim[39] = 8'h49;
    stim[40] = 8'hee;
    stim[41] = 8'h6e;
    stim[42] = 8'h9b;
    stim[43] = 8'h46;
    stim[44] = 8'had;
    stim[45] = 8'h7c;
    stim[46] = 8'h3b;
    stim[47] = 8'h73;
    stim[48] = 8'hc2;
    stim[49] = 8'h72;
    stim[50] = 8'h41;
    stim[51] = 8'h74;
    stim[52] = 8'h79;
    stim[53] = 8'h6f;
    stim[54] = 8'h14;
    stim[55] = 8'hf3;
    stim[56] = 8'h3b;
    stim[57] = 8'h95;
    stim[58] = 8'h99;
    stim[59] = 8'h38;
    stim[60] = 8'h6d;
    stim[61] = 8'hb3;
    stim[62] = 8'hd5;
    stim[63] = 8'h0a;
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
      expv[0] = 8'hba;
      expv[1] = 8'h0b;
      expv[2] = 8'h30;
      expv[3] = 8'h3d;
      expv[4] = 8'hdd;
      expv[5] = 8'hd7;
      expv[6] = 8'hc6;
      expv[7] = 8'heb;
      expv[8] = 8'hff;
      expv[9] = 8'h5d;
      expv[10] = 8'h5f;
      expv[11] = 8'h82;
      expv[12] = 8'he7;
      expv[13] = 8'h86;
      expv[14] = 8'h97;
      expv[15] = 8'hfa;
      expv[16] = 8'h95;
      expv[17] = 8'h48;
      expv[18] = 8'h14;
      expv[19] = 8'h47;
      expv[20] = 8'hf9;
      expv[21] = 8'h7d;
      expv[22] = 8'h4e;
      expv[23] = 8'hfb;
      expv[24] = 8'hd5;
      expv[25] = 8'h29;
      expv[26] = 8'h31;
      expv[27] = 8'h59;
      expv[28] = 8'h6c;
      expv[29] = 8'hd2;
      expv[30] = 8'hd6;
      expv[31] = 8'h57;
      expv[32] = 8'h23;
      expv[33] = 8'hb4;
      expv[34] = 8'h4e;
      expv[35] = 8'h38;
      expv[36] = 8'ha5;
      expv[37] = 8'h20;
      expv[38] = 8'he0;
      expv[39] = 8'h90;
      expv[40] = 8'h93;
      expv[41] = 8'h40;
      expv[42] = 8'h4a;
      expv[43] = 8'hc5;
      expv[44] = 8'h65;
      expv[45] = 8'hae;
      expv[46] = 8'h64;
      expv[47] = 8'hfb;
      expv[48] = 8'h2a;
      expv[49] = 8'hf4;
      expv[50] = 8'he8;
      expv[51] = 8'hd6;
      expv[52] = 8'h9d;
      expv[53] = 8'h4f;
      expv[54] = 8'hcc;
      expv[55] = 8'h28;
      expv[56] = 8'h64;
      expv[57] = 8'h10;
      expv[58] = 8'h54;
      expv[59] = 8'h75;
      expv[60] = 8'h51;
      expv[61] = 8'hcf;
      expv[62] = 8'hf7;
      expv[63] = 8'h66;
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
