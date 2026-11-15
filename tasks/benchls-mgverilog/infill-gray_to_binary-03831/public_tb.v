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

  mg_03831 dut (
    .gray_input(in_vec[7:0]),
    .bin_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h2f;
    stim[1] = 8'ha1;
    stim[2] = 8'hde;
    stim[3] = 8'h82;
    stim[4] = 8'hc1;
    stim[5] = 8'h75;
    stim[6] = 8'h4b;
    stim[7] = 8'h17;
    stim[8] = 8'h95;
    stim[9] = 8'h1c;
    stim[10] = 8'h46;
    stim[11] = 8'h6c;
    stim[12] = 8'h7b;
    stim[13] = 8'h9c;
    stim[14] = 8'h2a;
    stim[15] = 8'h52;
    stim[16] = 8'h85;
    stim[17] = 8'h2e;
    stim[18] = 8'hfe;
    stim[19] = 8'hf0;
    stim[20] = 8'h50;
    stim[21] = 8'hae;
    stim[22] = 8'h0b;
    stim[23] = 8'h95;
    stim[24] = 8'h74;
    stim[25] = 8'hf1;
    stim[26] = 8'h5f;
    stim[27] = 8'h36;
    stim[28] = 8'hc9;
    stim[29] = 8'hf8;
    stim[30] = 8'h66;
    stim[31] = 8'h5c;
    stim[32] = 8'h95;
    stim[33] = 8'h6d;
    stim[34] = 8'hcb;
    stim[35] = 8'haa;
    stim[36] = 8'h18;
    stim[37] = 8'he5;
    stim[38] = 8'hd4;
    stim[39] = 8'h4d;
    stim[40] = 8'hd0;
    stim[41] = 8'h5a;
    stim[42] = 8'h2f;
    stim[43] = 8'h12;
    stim[44] = 8'h62;
    stim[45] = 8'h6b;
    stim[46] = 8'hee;
    stim[47] = 8'h0c;
    stim[48] = 8'hfc;
    stim[49] = 8'h3e;
    stim[50] = 8'h23;
    stim[51] = 8'hd0;
    stim[52] = 8'hbc;
    stim[53] = 8'hdd;
    stim[54] = 8'hf2;
    stim[55] = 8'ha4;
    stim[56] = 8'hfa;
    stim[57] = 8'h75;
    stim[58] = 8'h0b;
    stim[59] = 8'hd7;
    stim[60] = 8'hf5;
    stim[61] = 8'h4e;
    stim[62] = 8'h3b;
    stim[63] = 8'hab;
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
      expv[0] = 8'h35;
      expv[1] = 8'hc1;
      expv[2] = 8'h94;
      expv[3] = 8'hfc;
      expv[4] = 8'h81;
      expv[5] = 8'h59;
      expv[6] = 8'h72;
      expv[7] = 8'h1a;
      expv[8] = 8'he6;
      expv[9] = 8'h17;
      expv[10] = 8'h7b;
      expv[11] = 8'h48;
      expv[12] = 8'h52;
      expv[13] = 8'he8;
      expv[14] = 8'h33;
      expv[15] = 8'h63;
      expv[16] = 8'hf9;
      expv[17] = 8'h34;
      expv[18] = 8'hab;
      expv[19] = 8'ha0;
      expv[20] = 8'h60;
      expv[21] = 8'hcb;
      expv[22] = 8'h0d;
      expv[23] = 8'he6;
      expv[24] = 8'h58;
      expv[25] = 8'ha1;
      expv[26] = 8'h6a;
      expv[27] = 8'h24;
      expv[28] = 8'h8e;
      expv[29] = 8'haf;
      expv[30] = 8'h44;
      expv[31] = 8'h68;
      expv[32] = 8'he6;
      expv[33] = 8'h49;
      expv[34] = 8'h8d;
      expv[35] = 8'hcc;
      expv[36] = 8'h10;
      expv[37] = 8'hb9;
      expv[38] = 8'h98;
      expv[39] = 8'h76;
      expv[40] = 8'h9f;
      expv[41] = 8'h6c;
      expv[42] = 8'h35;
      expv[43] = 8'h1c;
      expv[44] = 8'h43;
      expv[45] = 8'h4d;
      expv[46] = 8'hb4;
      expv[47] = 8'h08;
      expv[48] = 8'ha8;
      expv[49] = 8'h2b;
      expv[50] = 8'h3d;
      expv[51] = 8'h9f;
      expv[52] = 8'hd7;
      expv[53] = 8'h96;
      expv[54] = 8'ha3;
      expv[55] = 8'hc7;
      expv[56] = 8'hac;
      expv[57] = 8'h59;
      expv[58] = 8'h0d;
      expv[59] = 8'h9a;
      expv[60] = 8'ha6;
      expv[61] = 8'h74;
      expv[62] = 8'h2d;
      expv[63] = 8'hcd;
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
