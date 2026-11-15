// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_105279 dut (
    .A(in_vec[31:16]),
    .B(in_vec[15:0]),
    .Sum(out_vec[16:1]),
    .CO(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hbd56100f;
    stim[1] = 32'h555f196e;
    stim[2] = 32'h4b38ca96;
    stim[3] = 32'h6f556a5f;
    stim[4] = 32'hc3ff55ab;
    stim[5] = 32'hca011d81;
    stim[6] = 32'hd3e19f98;
    stim[7] = 32'h0df452a8;
    stim[8] = 32'h4046593b;
    stim[9] = 32'h473ac6fc;
    stim[10] = 32'h65be7038;
    stim[11] = 32'hc7e069b0;
    stim[12] = 32'h4e2d6f2b;
    stim[13] = 32'h22fe6059;
    stim[14] = 32'hdd83d26d;
    stim[15] = 32'he8359aa3;
    stim[16] = 32'h911a1cbc;
    stim[17] = 32'h48680850;
    stim[18] = 32'h32216a3c;
    stim[19] = 32'h66e77c70;
    stim[20] = 32'hbdc65106;
    stim[21] = 32'h3ba5e259;
    stim[22] = 32'hb70aeec7;
    stim[23] = 32'h294a8c80;
    stim[24] = 32'hd62811d6;
    stim[25] = 32'hb76c280d;
    stim[26] = 32'h82d4ff84;
    stim[27] = 32'h9731152b;
    stim[28] = 32'h59de1612;
    stim[29] = 32'hd31ef0be;
    stim[30] = 32'h96c8de0f;
    stim[31] = 32'hf65d774e;
    stim[32] = 32'h8a20f3c3;
    stim[33] = 32'h0b7779f9;
    stim[34] = 32'hd3cc976c;
    stim[35] = 32'ha34c0f17;
    stim[36] = 32'h204529d5;
    stim[37] = 32'h834191e5;
    stim[38] = 32'h1c894cce;
    stim[39] = 32'h121e8a40;
    stim[40] = 32'h5a0ceeff;
    stim[41] = 32'h2dd7f73b;
    stim[42] = 32'h721995dc;
    stim[43] = 32'hc0443e6f;
    stim[44] = 32'he217113e;
    stim[45] = 32'h12f354fb;
    stim[46] = 32'hab415c0a;
    stim[47] = 32'h6404ad8a;
    stim[48] = 32'h261eb794;
    stim[49] = 32'hf117bf0b;
    stim[50] = 32'h45bd0e98;
    stim[51] = 32'h209029f4;
    stim[52] = 32'h3bfb1804;
    stim[53] = 32'hdc28d3fd;
    stim[54] = 32'h917bcafe;
    stim[55] = 32'h0228f735;
    stim[56] = 32'hfa083ccd;
    stim[57] = 32'hed6c16a5;
    stim[58] = 32'h4e359def;
    stim[59] = 32'h62349a87;
    stim[60] = 32'haf883755;
    stim[61] = 32'h93a33ac6;
    stim[62] = 32'h10c74ab3;
    stim[63] = 32'h8be9c5c1;
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
      expv[0] = 17'h19aca;
      expv[1] = 17'h0dd9a;
      expv[2] = 17'h02b9d;
      expv[3] = 17'h1b368;
      expv[4] = 17'h03355;
      expv[5] = 17'h1cf04;
      expv[6] = 17'h0e6f3;
      expv[7] = 17'h0c138;
      expv[8] = 17'h13302;
      expv[9] = 17'h01c6d;
      expv[10] = 17'h1abec;
      expv[11] = 17'h06321;
      expv[12] = 17'h17ab0;
      expv[13] = 17'h106ae;
      expv[14] = 17'h17fe1;
      expv[15] = 17'h105b1;
      expv[16] = 17'h15bac;
      expv[17] = 17'h0a170;
      expv[18] = 17'h138ba;
      expv[19] = 17'h1c6ae;
      expv[20] = 17'h01d99;
      expv[21] = 17'h03dfd;
      expv[22] = 17'h14ba3;
      expv[23] = 17'h16b94;
      expv[24] = 17'h1d1fc;
      expv[25] = 17'h1def2;
      expv[26] = 17'h104b1;
      expv[27] = 17'h158b8;
      expv[28] = 17'h0ffe0;
      expv[29] = 17'h187b9;
      expv[30] = 17'h0e9af;
      expv[31] = 17'h0db57;
      expv[32] = 17'h0fbc7;
      expv[33] = 17'h10ae0;
      expv[34] = 17'h0d671;
      expv[35] = 17'h164c6;
      expv[36] = 17'h09434;
      expv[37] = 17'h02a4d;
      expv[38] = 17'h0d2ae;
      expv[39] = 17'h138bc;
      expv[40] = 17'h09217;
      expv[41] = 17'h04a25;
      expv[42] = 17'h00feb;
      expv[43] = 17'h1fd67;
      expv[44] = 17'h1e6ab;
      expv[45] = 17'h0cfdc;
      expv[46] = 17'h00e97;
      expv[47] = 17'h0231d;
      expv[48] = 17'h1bb64;
      expv[49] = 17'h16045;
      expv[50] = 17'h0a8aa;
      expv[51] = 17'h09508;
      expv[52] = 17'h0a9fe;
      expv[53] = 17'h1604b;
      expv[54] = 17'h0b8f3;
      expv[55] = 17'h1f2bb;
      expv[56] = 17'h06dab;
      expv[57] = 17'h00823;
      expv[58] = 17'h1d848;
      expv[59] = 17'h1f977;
      expv[60] = 17'h1cdba;
      expv[61] = 17'h19cd2;
      expv[62] = 17'h0b6f4;
      expv[63] = 17'h0a355;
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
