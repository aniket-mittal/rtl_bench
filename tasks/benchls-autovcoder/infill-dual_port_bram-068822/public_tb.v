// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 62;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_068822 dut (
    .clk_a(in_vec[61:61]),
    .clk_b(in_vec[60:60]),
    .en_a(in_vec[59:59]),
    .write_a(in_vec[58:58]),
    .din_a(in_vec[57:40]),
    .addr_a(in_vec[39:30]),
    .en_b(in_vec[29:29]),
    .write_b(in_vec[28:28]),
    .din_b(in_vec[27:10]),
    .addr_b(in_vec[9:0]),
    .dout_a(out_vec[35:18]),
    .dout_b(out_vec[17:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 62'h2ba01f9a142046b3;
    stim[1] = 62'h00d88c0aa6f17660;
    stim[2] = 62'h078c63cf709ad217;
    stim[3] = 62'h008fbe010f6a9589;
    stim[4] = 62'h1d388579b5d9ffbd;
    stim[5] = 62'h1f1d611e72f9f549;
    stim[6] = 62'h1a8cec814cbcc045;
    stim[7] = 62'h07edd8ee4952a8d3;
    stim[8] = 62'h17997792d36222b6;
    stim[9] = 62'h0d3f3dc361529e55;
    stim[10] = 62'h2f977871b5c84e03;
    stim[11] = 62'h0df8b7ce5824c9a7;
    stim[12] = 62'h35e7c10d4f9e6843;
    stim[13] = 62'h1287ba42c13b5856;
    stim[14] = 62'h3beea5be0d0ee2ef;
    stim[15] = 62'h188ea0236299c657;
    stim[16] = 62'h131cb8eb4c5efe9e;
    stim[17] = 62'h3d5ba0c57937ef11;
    stim[18] = 62'h0961e23d990f6e20;
    stim[19] = 62'h143ab0bdbce6d1ed;
    stim[20] = 62'h242ce6f3da137521;
    stim[21] = 62'h1515953c0905032b;
    stim[22] = 62'h19d91e99a9a7e397;
    stim[23] = 62'h33e6475bb50cb6d7;
    stim[24] = 62'h37b5fd9cc4ddaa1b;
    stim[25] = 62'h3d4c4f520fd3643a;
    stim[26] = 62'h1e21a11e2cee4c62;
    stim[27] = 62'h201f618cba27273a;
    stim[28] = 62'h0f6105f15816f927;
    stim[29] = 62'h115c4635bec458ba;
    stim[30] = 62'h1e699cfe19dcd1b3;
    stim[31] = 62'h151055afbc904d28;
    stim[32] = 62'h1e280b9daaec07ee;
    stim[33] = 62'h1a143b64d7625811;
    stim[34] = 62'h320aa350317dd7ea;
    stim[35] = 62'h1d36d1c1cd8329af;
    stim[36] = 62'h1d089cd26870937a;
    stim[37] = 62'h21fb36ecd860cded;
    stim[38] = 62'h284c7c4cc1b9bb92;
    stim[39] = 62'h14d40890dd069992;
    stim[40] = 62'h154fb87677c7c978;
    stim[41] = 62'h223e546bf5a5e3e7;
    stim[42] = 62'h1969d6afbfca17ff;
    stim[43] = 62'h3992cbea4855fa28;
    stim[44] = 62'h0d3cc28250723b28;
    stim[45] = 62'h031c1e57e87ffce1;
    stim[46] = 62'h112b714f049dc800;
    stim[47] = 62'h1cd8acb916d12133;
    stim[48] = 62'h12fac6c45b19a38d;
    stim[49] = 62'h2f6be48766fdcfac;
    stim[50] = 62'h24f23a5807a7ecc1;
    stim[51] = 62'h2b26afe058ccd817;
    stim[52] = 62'h1095bed1cda24df9;
    stim[53] = 62'h36f9723ecdd94a78;
    stim[54] = 62'h305a26dd1d59aeab;
    stim[55] = 62'h333d8b6fb40de3ba;
    stim[56] = 62'h30fd8eeee83e236d;
    stim[57] = 62'h2b0e84ada291c69c;
    stim[58] = 62'h0606ff80169691a8;
    stim[59] = 62'h1d8c88fef2bd82b5;
    stim[60] = 62'h397ae50e8d64c9ae;
    stim[61] = 62'h34bbb4318bd0ecb0;
    stim[62] = 62'h2779c968476ecd12;
    stim[63] = 62'h18a7e36eca7765c0;
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
      expv[0] = 36'h0000xxxxx;
      expv[1] = 36'h0000xxxxx;
      expv[2] = 36'h0000xxxxx;
      expv[3] = 36'h0000xxxxx;
      expv[4] = 36'h0000xxxxx;
      expv[5] = 36'h0000xxxxx;
      expv[6] = 36'h0000xxxxx;
      expv[7] = 36'h0000xxxxx;
      expv[8] = 36'h0000xxxxx;
      expv[9] = 36'h0000xxxxx;
      expv[10] = 36'h0000xxxxx;
      expv[11] = 36'h0000xxxxx;
      expv[12] = 36'h0000xxxxx;
      expv[13] = 36'h0000xxxxx;
      expv[14] = 36'h0000xxxxx;
      expv[15] = 36'h0000xxxxx;
      expv[16] = 36'h0000xxxxx;
      expv[17] = 36'h0000xxxxx;
      expv[18] = 36'h0000xxxxx;
      expv[19] = 36'h0000xxxxx;
      expv[20] = 36'h0000xxxxx;
      expv[21] = 36'h0000xxxxx;
      expv[22] = 36'h0000xxxxx;
      expv[23] = 36'h0000xxxxx;
      expv[24] = 36'h0000xxxxx;
      expv[25] = 36'h0000xxxxx;
      expv[26] = 36'h0000xxxxx;
      expv[27] = 36'h0000xxxxx;
      expv[28] = 36'h0000xxxxx;
      expv[29] = 36'h0000xxxxx;
      expv[30] = 36'h0000xxxxx;
      expv[31] = 36'h0000xxxxx;
      expv[32] = 36'h0000xxxxx;
      expv[33] = 36'h0000xxxxx;
      expv[34] = 36'h0000xxxxx;
      expv[35] = 36'h0000xxxxx;
      expv[36] = 36'h0000xxxxx;
      expv[37] = 36'h0000xxxxx;
      expv[38] = 36'h0000xxxxx;
      expv[39] = 36'h0000xxxxx;
      expv[40] = 36'h0000xxxxx;
      expv[41] = 36'h0000xxxxx;
      expv[42] = 36'h0000xxxxx;
      expv[43] = 36'h0000xxxxx;
      expv[44] = 36'h0000xxxxx;
      expv[45] = 36'h0000xxxxx;
      expv[46] = 36'h0000xxxxx;
      expv[47] = 36'h0000xxxxx;
      expv[48] = 36'h0000xxxxx;
      expv[49] = 36'h0000xxxxx;
      expv[50] = 36'h0000xxxxx;
      expv[51] = 36'h0000xxxxx;
      expv[52] = 36'h0000xxxxx;
      expv[53] = 36'h0000xxxxx;
      expv[54] = 36'h0000xxxxx;
      expv[55] = 36'h0000xxxxx;
      expv[56] = 36'h0000xxxxx;
      expv[57] = 36'h0000xxxxx;
      expv[58] = 36'h0000xxxxx;
      expv[59] = 36'h0000xxxxx;
      expv[60] = 36'h0000xxxxx;
      expv[61] = 36'h0000xxxxx;
      expv[62] = 36'h0000xxxxx;
      expv[63] = 36'h0000xxxxx;
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
