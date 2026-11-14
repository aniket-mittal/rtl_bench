// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[7:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h0f;
    stim[1] = 8'h4e;
    stim[2] = 8'h4c;
    stim[3] = 8'h60;
    stim[4] = 8'h27;
    stim[5] = 8'h2d;
    stim[6] = 8'h93;
    stim[7] = 8'h65;
    stim[8] = 8'h33;
    stim[9] = 8'h02;
    stim[10] = 8'h81;
    stim[11] = 8'hbc;
    stim[12] = 8'hdc;
    stim[13] = 8'he7;
    stim[14] = 8'h9a;
    stim[15] = 8'hea;
    stim[16] = 8'hcc;
    stim[17] = 8'h4e;
    stim[18] = 8'h6b;
    stim[19] = 8'hfc;
    stim[20] = 8'hf3;
    stim[21] = 8'hb4;
    stim[22] = 8'h98;
    stim[23] = 8'h76;
    stim[24] = 8'h6c;
    stim[25] = 8'ha0;
    stim[26] = 8'hf8;
    stim[27] = 8'h7a;
    stim[28] = 8'h7f;
    stim[29] = 8'h31;
    stim[30] = 8'hd3;
    stim[31] = 8'h08;
    stim[32] = 8'h40;
    stim[33] = 8'hcf;
    stim[34] = 8'h14;
    stim[35] = 8'hdc;
    stim[36] = 8'he8;
    stim[37] = 8'h64;
    stim[38] = 8'h57;
    stim[39] = 8'hf9;
    stim[40] = 8'hde;
    stim[41] = 8'h0a;
    stim[42] = 8'h59;
    stim[43] = 8'had;
    stim[44] = 8'h48;
    stim[45] = 8'h03;
    stim[46] = 8'h9c;
    stim[47] = 8'hb4;
    stim[48] = 8'h3a;
    stim[49] = 8'hf0;
    stim[50] = 8'hd1;
    stim[51] = 8'h77;
    stim[52] = 8'h7b;
    stim[53] = 8'hfe;
    stim[54] = 8'hcf;
    stim[55] = 8'had;
    stim[56] = 8'h44;
    stim[57] = 8'hfc;
    stim[58] = 8'h41;
    stim[59] = 8'h06;
    stim[60] = 8'h1c;
    stim[61] = 8'hf9;
    stim[62] = 8'h04;
    stim[63] = 8'h45;
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
      expv[0] = 32'h0000000f;
      expv[1] = 32'hffffff4e;
      expv[2] = 32'hffffff4c;
      expv[3] = 32'hffffff60;
      expv[4] = 32'h00000027;
      expv[5] = 32'h0000002d;
      expv[6] = 32'h00000093;
      expv[7] = 32'hffffff65;
      expv[8] = 32'h00000033;
      expv[9] = 32'h00000002;
      expv[10] = 32'h00000081;
      expv[11] = 32'h000000bc;
      expv[12] = 32'hffffffdc;
      expv[13] = 32'hffffffe7;
      expv[14] = 32'h0000009a;
      expv[15] = 32'hffffffea;
      expv[16] = 32'hffffffcc;
      expv[17] = 32'hffffff4e;
      expv[18] = 32'hffffff6b;
      expv[19] = 32'hfffffffc;
      expv[20] = 32'hfffffff3;
      expv[21] = 32'h000000b4;
      expv[22] = 32'h00000098;
      expv[23] = 32'hffffff76;
      expv[24] = 32'hffffff6c;
      expv[25] = 32'h000000a0;
      expv[26] = 32'hfffffff8;
      expv[27] = 32'hffffff7a;
      expv[28] = 32'hffffff7f;
      expv[29] = 32'h00000031;
      expv[30] = 32'hffffffd3;
      expv[31] = 32'h00000008;
      expv[32] = 32'hffffff40;
      expv[33] = 32'hffffffcf;
      expv[34] = 32'h00000014;
      expv[35] = 32'hffffffdc;
      expv[36] = 32'hffffffe8;
      expv[37] = 32'hffffff64;
      expv[38] = 32'hffffff57;
      expv[39] = 32'hfffffff9;
      expv[40] = 32'hffffffde;
      expv[41] = 32'h0000000a;
      expv[42] = 32'hffffff59;
      expv[43] = 32'h000000ad;
      expv[44] = 32'hffffff48;
      expv[45] = 32'h00000003;
      expv[46] = 32'h0000009c;
      expv[47] = 32'h000000b4;
      expv[48] = 32'h0000003a;
      expv[49] = 32'hfffffff0;
      expv[50] = 32'hffffffd1;
      expv[51] = 32'hffffff77;
      expv[52] = 32'hffffff7b;
      expv[53] = 32'hfffffffe;
      expv[54] = 32'hffffffcf;
      expv[55] = 32'h000000ad;
      expv[56] = 32'hffffff44;
      expv[57] = 32'hfffffffc;
      expv[58] = 32'hffffff41;
      expv[59] = 32'h00000006;
      expv[60] = 32'h0000001c;
      expv[61] = 32'hfffffff9;
      expv[62] = 32'h00000004;
      expv[63] = 32'hffffff45;
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
