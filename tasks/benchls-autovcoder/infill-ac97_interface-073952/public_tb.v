// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_073952 dut (
    .ac97_bit_clock(clk),
    .command_address(in_vec[67:60]),
    .command_data(in_vec[59:44]),
    .command_valid(in_vec[43:43]),
    .left_data(in_vec[42:23]),
    .left_valid(in_vec[22:22]),
    .right_data(in_vec[21:2]),
    .right_valid(in_vec[1:1]),
    .ac97_sdata_in(in_vec[0:0]),
    .ready(out_vec[42:42]),
    .left_in_data(out_vec[41:22]),
    .right_in_data(out_vec[21:2]),
    .ac97_sdata_out(out_vec[1:1]),
    .ac97_synch(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hd5ebbe55523302949;
    stim[1] = 68'h0c44dbe1134f1c5d1;
    stim[2] = 68'h8eeac4a5179679e8b;
    stim[3] = 68'h242682e9665bfe446;
    stim[4] = 68'h444372a51b2b2ffcd;
    stim[5] = 68'hcc726346fabf37e60;
    stim[6] = 68'h0eff3177559e06f15;
    stim[7] = 68'h1429f326875384ac8;
    stim[8] = 68'hc88761ee89ce22aeb;
    stim[9] = 68'h75afcdd4fc907aeee;
    stim[10] = 68'h02381c664d94ede45;
    stim[11] = 68'h029661f2b590cca7d;
    stim[12] = 68'hc7366606ec11cba87;
    stim[13] = 68'h4931807f7533166e8;
    stim[14] = 68'h9c2eeb8a4599624d8;
    stim[15] = 68'hb58acf10d8ed2ba21;
    stim[16] = 68'h6fc45bf638f514202;
    stim[17] = 68'h40c2b9ca65fa5ca77;
    stim[18] = 68'h1b0f7210c9cf40e1c;
    stim[19] = 68'h1989dfcb299b00a70;
    stim[20] = 68'h0e9a363cea815a7d2;
    stim[21] = 68'h913652e0da3a3d6c3;
    stim[22] = 68'h541aa75b5572b407b;
    stim[23] = 68'h5272ab2483846da91;
    stim[24] = 68'h296c79daab1ec3bb9;
    stim[25] = 68'hfd03172f9f321c326;
    stim[26] = 68'h6aa86c0521a7cf30d;
    stim[27] = 68'hea1765bd1844b0209;
    stim[28] = 68'ha2d1fe8e87d569c1a;
    stim[29] = 68'hc5837ab228608b2d0;
    stim[30] = 68'h7cf7756ab1d54666b;
    stim[31] = 68'h4202355321fb93d42;
    stim[32] = 68'h244f2593e49315b4c;
    stim[33] = 68'h765dd1c1574842f43;
    stim[34] = 68'h5756b185a092ccc6b;
    stim[35] = 68'h46d10a05e95540093;
    stim[36] = 68'h1d977b6083196af1e;
    stim[37] = 68'hf856755bad3e492f9;
    stim[38] = 68'h7b2e6c01769180021;
    stim[39] = 68'hf6a7869e66c9fb0ee;
    stim[40] = 68'hf1f6e1530ce2a26d7;
    stim[41] = 68'h2ec4f7efc2435d0ca;
    stim[42] = 68'hb141bac7fb59f03ba;
    stim[43] = 68'hae50c7466cb95d5d9;
    stim[44] = 68'hdc9628b196e09cd60;
    stim[45] = 68'h4056d1b0723dc44ba;
    stim[46] = 68'h7b6a49f2bb8eac156;
    stim[47] = 68'h26f9127123563c78f;
    stim[48] = 68'hf4c1fc497d284a623;
    stim[49] = 68'h8a233e2e2e343ced9;
    stim[50] = 68'hc56ad0dcda8a6ef3e;
    stim[51] = 68'hcf297680eacdb016e;
    stim[52] = 68'hf856cb7130d8ef0c8;
    stim[53] = 68'hbe48f17c03d5ca536;
    stim[54] = 68'h18849a48567cf7728;
    stim[55] = 68'h6e6a30073bb7a3788;
    stim[56] = 68'he0f3ac0745f86776b;
    stim[57] = 68'h053c624c6d304b3a2;
    stim[58] = 68'h631e838b2f0c4677e;
    stim[59] = 68'h8991e45aebf915f61;
    stim[60] = 68'h9833fdf5f5c3c0cd4;
    stim[61] = 68'h0a2fac38bb6dd08c2;
    stim[62] = 68'h82985d883da333e23;
    stim[63] = 68'hc46a3bc5731e308c5;
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
      expv[0] = 43'h00000000000;
      expv[1] = 43'h00000000002;
      expv[2] = 43'h00000000000;
      expv[3] = 43'h00000000000;
      expv[4] = 43'h00000000000;
      expv[5] = 43'h00000000000;
      expv[6] = 43'h00000000000;
      expv[7] = 43'h00000000000;
      expv[8] = 43'h00000000000;
      expv[9] = 43'h00000000000;
      expv[10] = 43'h00000000000;
      expv[11] = 43'h00000000000;
      expv[12] = 43'h00000000000;
      expv[13] = 43'h00000000000;
      expv[14] = 43'h00000000000;
      expv[15] = 43'h00000000000;
      expv[16] = 43'h00000000000;
      expv[17] = 43'h00000000000;
      expv[18] = 43'h00000000000;
      expv[19] = 43'h00000000000;
      expv[20] = 43'h00000000000;
      expv[21] = 43'h00000000000;
      expv[22] = 43'h00000000000;
      expv[23] = 43'h00000000000;
      expv[24] = 43'h00000000000;
      expv[25] = 43'h00000000000;
      expv[26] = 43'h00000000000;
      expv[27] = 43'h00000000000;
      expv[28] = 43'h00000000000;
      expv[29] = 43'h00000000000;
      expv[30] = 43'h00000000000;
      expv[31] = 43'h00000000000;
      expv[32] = 43'h00000000000;
      expv[33] = 43'h00000000000;
      expv[34] = 43'h00000000000;
      expv[35] = 43'h00000000000;
      expv[36] = 43'h00000000000;
      expv[37] = 43'h00000000000;
      expv[38] = 43'h00000000000;
      expv[39] = 43'h00000000000;
      expv[40] = 43'h00000000000;
      expv[41] = 43'h00000000000;
      expv[42] = 43'h00000000000;
      expv[43] = 43'h00000000000;
      expv[44] = 43'h00000000000;
      expv[45] = 43'h00000000000;
      expv[46] = 43'h00000000000;
      expv[47] = 43'h00000000000;
      expv[48] = 43'h00000000000;
      expv[49] = 43'h00000000000;
      expv[50] = 43'h00000000000;
      expv[51] = 43'h00000000000;
      expv[52] = 43'h00000000000;
      expv[53] = 43'h00000000000;
      expv[54] = 43'h00000000000;
      expv[55] = 43'h00000000000;
      expv[56] = 43'h00000000000;
      expv[57] = 43'h00000400000;
      expv[58] = 43'h00000800000;
      expv[59] = 43'h00001000000;
      expv[60] = 43'h00002400000;
      expv[61] = 43'h00004800000;
      expv[62] = 43'h00009000000;
      expv[63] = 43'h00012400000;
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
