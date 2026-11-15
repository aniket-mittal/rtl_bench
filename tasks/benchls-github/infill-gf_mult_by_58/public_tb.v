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

  gf_mult_by_58 dut (
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
    stim[0] = 8'h55;
    stim[1] = 8'h29;
    stim[2] = 8'h9a;
    stim[3] = 8'hc4;
    stim[4] = 8'hba;
    stim[5] = 8'h43;
    stim[6] = 8'hbf;
    stim[7] = 8'hee;
    stim[8] = 8'h20;
    stim[9] = 8'haf;
    stim[10] = 8'hfe;
    stim[11] = 8'he5;
    stim[12] = 8'h06;
    stim[13] = 8'h51;
    stim[14] = 8'he6;
    stim[15] = 8'h44;
    stim[16] = 8'h18;
    stim[17] = 8'h6e;
    stim[18] = 8'h75;
    stim[19] = 8'h3f;
    stim[20] = 8'h77;
    stim[21] = 8'h03;
    stim[22] = 8'h9e;
    stim[23] = 8'h98;
    stim[24] = 8'h4b;
    stim[25] = 8'hb1;
    stim[26] = 8'h04;
    stim[27] = 8'h11;
    stim[28] = 8'he8;
    stim[29] = 8'hdb;
    stim[30] = 8'h33;
    stim[31] = 8'h31;
    stim[32] = 8'h06;
    stim[33] = 8'he0;
    stim[34] = 8'hd3;
    stim[35] = 8'hf2;
    stim[36] = 8'h70;
    stim[37] = 8'ha1;
    stim[38] = 8'h2f;
    stim[39] = 8'hff;
    stim[40] = 8'h56;
    stim[41] = 8'h47;
    stim[42] = 8'h97;
    stim[43] = 8'ha9;
    stim[44] = 8'h23;
    stim[45] = 8'h9a;
    stim[46] = 8'hb6;
    stim[47] = 8'h35;
    stim[48] = 8'h25;
    stim[49] = 8'h1f;
    stim[50] = 8'h58;
    stim[51] = 8'hd3;
    stim[52] = 8'h9b;
    stim[53] = 8'hb4;
    stim[54] = 8'h56;
    stim[55] = 8'h88;
    stim[56] = 8'h35;
    stim[57] = 8'h96;
    stim[58] = 8'h36;
    stim[59] = 8'h24;
    stim[60] = 8'h55;
    stim[61] = 8'h22;
    stim[62] = 8'h2f;
    stim[63] = 8'h97;
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
      expv[0] = 8'h4f;
      expv[1] = 8'h6d;
      expv[2] = 8'hb8;
      expv[3] = 8'he5;
      expv[4] = 8'h77;
      expv[5] = 8'h6b;
      expv[6] = 8'h52;
      expv[7] = 8'h60;
      expv[8] = 8'hcf;
      expv[9] = 8'hbb;
      expv[10] = 8'h89;
      expv[11] = 8'h72;
      expv[12] = 8'hcd;
      expv[13] = 8'h32;
      expv[14] = 8'h9a;
      expv[15] = 8'hfe;
      expv[16] = 8'h13;
      expv[17] = 8'h7b;
      expv[18] = 8'h80;
      expv[19] = 8'h49;
      expv[20] = 8'h30;
      expv[21] = 8'he8;
      expv[22] = 8'hc5;
      expv[23] = 8'h08;
      expv[24] = 8'h91;
      expv[25] = 8'h65;
      expv[26] = 8'h7d;
      expv[27] = 8'hb1;
      expv[28] = 8'had;
      expv[29] = 8'h63;
      expv[30] = 8'hce;
      expv[31] = 8'h7e;
      expv[32] = 8'hcd;
      expv[33] = 8'h57;
      expv[34] = 8'h99;
      expv[35] = 8'h0e;
      expv[36] = 8'ha5;
      expv[37] = 8'h8c;
      expv[38] = 8'ha0;
      expv[39] = 8'hd1;
      expv[40] = 8'ha7;
      expv[41] = 8'h16;
      expv[42] = 8'h67;
      expv[43] = 8'h76;
      expv[44] = 8'h27;
      expv[45] = 8'hb8;
      expv[46] = 8'hf0;
      expv[47] = 8'h03;
      expv[48] = 8'hea;
      expv[49] = 8'h86;
      expv[50] = 8'h90;
      expv[51] = 8'h99;
      expv[52] = 8'he0;
      expv[53] = 8'h40;
      expv[54] = 8'ha7;
      expv[55] = 8'he1;
      expv[56] = 8'h03;
      expv[57] = 8'h3f;
      expv[58] = 8'heb;
      expv[59] = 8'hb2;
      expv[60] = 8'h4f;
      expv[61] = 8'h7f;
      expv[62] = 8'ha0;
      expv[63] = 8'h67;
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
