// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09299 dut (
    .clk(clk),
    .clk28m(in_vec[27:27]),
    .reg_address_in(in_vec[26:19]),
    .data_in(in_vec[18:7]),
    .select(in_vec[6:1]),
    .a1k(in_vec[0:0]),
    .rgb(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'h202f93a;
    stim[1] = 28'h9e401e6;
    stim[2] = 28'hda91b07;
    stim[3] = 28'ha1cd54f;
    stim[4] = 28'h231eed1;
    stim[5] = 28'h1728a77;
    stim[6] = 28'h91d4894;
    stim[7] = 28'h9e58b22;
    stim[8] = 28'h18cb581;
    stim[9] = 28'h612c76b;
    stim[10] = 28'hea881df;
    stim[11] = 28'h8556303;
    stim[12] = 28'h1c3320b;
    stim[13] = 28'h71961ec;
    stim[14] = 28'hf4463d1;
    stim[15] = 28'h21792ac;
    stim[16] = 28'h58a84eb;
    stim[17] = 28'hdead7a9;
    stim[18] = 28'he02a804;
    stim[19] = 28'he4f94ad;
    stim[20] = 28'h60b864f;
    stim[21] = 28'h90cdb34;
    stim[22] = 28'h9d81d83;
    stim[23] = 28'h2eb77c2;
    stim[24] = 28'hf46e847;
    stim[25] = 28'h7fd91b6;
    stim[26] = 28'ha24789f;
    stim[27] = 28'hae9e1b9;
    stim[28] = 28'h5c6b562;
    stim[29] = 28'h0f0534e;
    stim[30] = 28'h67bf11f;
    stim[31] = 28'h53ec64b;
    stim[32] = 28'h91ced21;
    stim[33] = 28'h4072331;
    stim[34] = 28'h6beccf4;
    stim[35] = 28'hd8faeaa;
    stim[36] = 28'h4a2fa88;
    stim[37] = 28'ha77fe67;
    stim[38] = 28'h8785c63;
    stim[39] = 28'hb8417e8;
    stim[40] = 28'hff5ad05;
    stim[41] = 28'hfc21288;
    stim[42] = 28'hd803544;
    stim[43] = 28'hb04b51e;
    stim[44] = 28'h6086557;
    stim[45] = 28'h8d4acf8;
    stim[46] = 28'h48e4798;
    stim[47] = 28'h537cb74;
    stim[48] = 28'h19c4702;
    stim[49] = 28'hd20db57;
    stim[50] = 28'h3b2ab9d;
    stim[51] = 28'h5658cf6;
    stim[52] = 28'h8c15e66;
    stim[53] = 28'hc55a229;
    stim[54] = 28'hdfbe218;
    stim[55] = 28'hd74d509;
    stim[56] = 28'h45f5be9;
    stim[57] = 28'ha5971cd;
    stim[58] = 28'hb37ee73;
    stim[59] = 28'h159cec1;
    stim[60] = 28'h4d329cf;
    stim[61] = 28'h69777ca;
    stim[62] = 28'hace987d;
    stim[63] = 28'hc7aa369;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'hxxx;
      expv[4] = 12'hxxx;
      expv[5] = 12'hxxx;
      expv[6] = 12'hxxx;
      expv[7] = 12'hxxx;
      expv[8] = 12'hxxx;
      expv[9] = 12'hxxx;
      expv[10] = 12'hxxx;
      expv[11] = 12'hxxx;
      expv[12] = 12'hxxx;
      expv[13] = 12'hxxx;
      expv[14] = 12'hxxx;
      expv[15] = 12'hxxx;
      expv[16] = 12'hxxx;
      expv[17] = 12'hxxx;
      expv[18] = 12'hxxx;
      expv[19] = 12'hxxx;
      expv[20] = 12'hxxx;
      expv[21] = 12'hxxx;
      expv[22] = 12'hxxx;
      expv[23] = 12'hxxx;
      expv[24] = 12'hxxx;
      expv[25] = 12'hxxx;
      expv[26] = 12'hxxx;
      expv[27] = 12'hxxx;
      expv[28] = 12'hxxx;
      expv[29] = 12'hxxx;
      expv[30] = 12'hxxx;
      expv[31] = 12'hxxx;
      expv[32] = 12'hxxx;
      expv[33] = 12'hxxx;
      expv[34] = 12'hxxx;
      expv[35] = 12'h103;
      expv[36] = 12'h103;
      expv[37] = 12'hxxx;
      expv[38] = 12'hxxx;
      expv[39] = 12'hxxx;
      expv[40] = 12'hxxx;
      expv[41] = 12'hxxx;
      expv[42] = 12'hxxx;
      expv[43] = 12'hxxx;
      expv[44] = 12'hxxx;
      expv[45] = 12'hxxx;
      expv[46] = 12'hxxx;
      expv[47] = 12'hxxx;
      expv[48] = 12'hxxx;
      expv[49] = 12'hxxx;
      expv[50] = 12'hxxx;
      expv[51] = 12'hxxx;
      expv[52] = 12'hxxx;
      expv[53] = 12'hxxx;
      expv[54] = 12'hxxx;
      expv[55] = 12'hxxx;
      expv[56] = 12'hxxx;
      expv[57] = 12'hxxx;
      expv[58] = 12'hxxx;
      expv[59] = 12'hxxx;
      expv[60] = 12'hxxx;
      expv[61] = 12'hxxx;
      expv[62] = 12'hxxx;
      expv[63] = 12'hxxx;
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
