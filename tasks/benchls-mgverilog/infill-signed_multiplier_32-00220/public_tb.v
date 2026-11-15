// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00220 dut (
    .a(in_vec[63:32]),
    .b(in_vec[31:0]),
    .c(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hfc18880daa901da6;
    stim[1] = 64'h5a286c1a8413b23c;
    stim[2] = 64'h04bcb301c4253ef5;
    stim[3] = 64'h388ba788ba6435dc;
    stim[4] = 64'h601d9ae03ccc7ffd;
    stim[5] = 64'hf2d0a394a08b7dce;
    stim[6] = 64'h0f06cc9c493f2179;
    stim[7] = 64'hce527350fc11ceb4;
    stim[8] = 64'h3aaf05a88267ceaf;
    stim[9] = 64'h3902d76ecbca5f2b;
    stim[10] = 64'h992a748fe3a5b016;
    stim[11] = 64'h9fbcf2e0e0bacece;
    stim[12] = 64'h230061ca79437987;
    stim[13] = 64'h24f75fe1325ff217;
    stim[14] = 64'hcfea5656a12bd849;
    stim[15] = 64'hb77dbde5969afce3;
    stim[16] = 64'h3cd02c2d856df530;
    stim[17] = 64'hb490bb86f0bd3403;
    stim[18] = 64'haa270bd0fd45bc59;
    stim[19] = 64'h339b4a8613b08981;
    stim[20] = 64'h50e03599c9fa8ef1;
    stim[21] = 64'h5c6a7916fecff037;
    stim[22] = 64'hdccd33f727d7dec0;
    stim[23] = 64'h9930c8026b271d8e;
    stim[24] = 64'h5fe7e7eb4666548d;
    stim[25] = 64'h03256979e6f5f6f8;
    stim[26] = 64'hb6c9701fd6969ffd;
    stim[27] = 64'h44720a60dc222a2c;
    stim[28] = 64'he66ac40407cbbf13;
    stim[29] = 64'h25fdcd0f055cfe3c;
    stim[30] = 64'h1b214b12b1c7270d;
    stim[31] = 64'h6aa951402c9c49e5;
    stim[32] = 64'hb96e24c83c0188c1;
    stim[33] = 64'h9d13547d9c1e3ae6;
    stim[34] = 64'ha9b0fba2a8b524c4;
    stim[35] = 64'h3abd33db1f031180;
    stim[36] = 64'h9e72e1ece41a1c6c;
    stim[37] = 64'ha3e75ebd83807c6b;
    stim[38] = 64'h80e40aa7d05d28f8;
    stim[39] = 64'h69be07c7935d0555;
    stim[40] = 64'h30cca189edeaf9c7;
    stim[41] = 64'h5b0539da51b76453;
    stim[42] = 64'h83161963f5be6a86;
    stim[43] = 64'h639cff19c7f8c7e4;
    stim[44] = 64'hc42278fd6c375bff;
    stim[45] = 64'ha91e025cfe4e812f;
    stim[46] = 64'had75034ec96f1eb0;
    stim[47] = 64'hb6e451f8f642496f;
    stim[48] = 64'h6aad24be42d06eb9;
    stim[49] = 64'h6857c13e53f61424;
    stim[50] = 64'h83aa71660fb2e8be;
    stim[51] = 64'he2e49cbf9102bf13;
    stim[52] = 64'hf0098ae83d20b597;
    stim[53] = 64'heccb490a6965da3e;
    stim[54] = 64'h941fc5ce5a6927b0;
    stim[55] = 64'h6db40d1f695a1471;
    stim[56] = 64'h17f855d9cb358da5;
    stim[57] = 64'h584b5f4a42299adf;
    stim[58] = 64'ha7d30462e1fe78e6;
    stim[59] = 64'h0c411375355ea6f3;
    stim[60] = 64'h10fc44805fd89962;
    stim[61] = 64'h2194c46f00e61697;
    stim[62] = 64'h119517f5e4f02e3e;
    stim[63] = 64'h1c99b69f4d29723d;
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
      expv[0] = 64'h014d8fa468a1b16e;
      expv[1] = 64'hd45b5b68aa916a18;
      expv[2] = 64'hfee4767bdf168df5;
      expv[3] = 64'hf09ff2a3c2d320e0;
      expv[4] = 64'h16d3b7f197972f60;
      expv[5] = 64'h04ea9376951ee518;
      expv[6] = 64'h044ca4fbd0fad1bc;
      expv[7] = 64'h00c3418fd3137440;
      expv[8] = 64'he335a7038aca0dd8;
      expv[9] = 64'hf45f7ad5d838017a;
      expv[10] = 64'h0b63a26d46f3544a;
      expv[11] = 64'h0bc223290c3bb040;
      expv[12] = 64'h109467efb54a0b86;
      expv[13] = 64'h07462b7bb15b4f37;
      expv[14] = 64'h11cfcdb2991d2e86;
      expv[15] = 64'h1dda0962e52ece0f;
      expv[16] = 64'he2e219a7d1785970;
      expv[17] = 64'h047f33ce95b76a92;
      expv[18] = 64'h00ea2839934fdb50;
      expv[19] = 64'h03f81d034a424386;
      expv[20] = 64'heeeefc98f9375309;
      expv[21] = 64'hff923bdd692ea3ba;
      expv[22] = 64'hfa8594a0d2682b40;
      expv[23] = 64'hd4f7ae28ce052b1c;
      expv[24] = 64'h1a5fbf7d9475d86f;
      expv[25] = 64'hffb13920a6657338;
      expv[26] = 64'h0bd7dfe15de10fa3;
      expv[27] = 64'hf66918f65a0d8880;
      expv[28] = 64'hff388eed4d57884c;
      expv[29] = 64'h00cbc1f1b554f184;
      expv[30] = 64'hf7b5d4da401e8dea;
      expv[31] = 64'h129637ee34a0ee40;
      expv[32] = 64'hef75645a545bfac8;
      expv[33] = 64'h2698c48093283a4e;
      expv[34] = 64'h1d6e173d086d7008;
      expv[35] = 64'h071d9d830f9c7880;
      expv[36] = 64'h0aa17c208b251f90;
      expv[37] = 64'h2cc9cdaaa91824ff;
      expv[38] = 64'h17a6fc810d3f69c8;
      expv[39] = 64'hd32082ecea8a7813;
      expv[40] = 64'hfc8d9aab7469d27f;
      expv[41] = 64'h1d0ddbb5e220e9ae;
      expv[42] = 64'h050123555a8e47d2;
      expv[43] = 64'hea32d9125157a144;
      expv[44] = 64'he6b198ef59b37303;
      expv[45] = 64'h00931f482bbacae4;
      expv[46] = 64'h11980821a3a769a0;
      expv[47] = 64'h02c826b0da4f4288;
      expv[48] = 64'h1bd77e4a5349314e;
      expv[49] = 64'h2238c030530404b8;
      expv[50] = 64'hf860181e023099b4;
      expv[51] = 64'h0c9e9018d068232d;
      expv[52] = 64'hfc303bf7f9d6f6d8;
      expv[53] = 64'hf817bcc96060346c;
      expv[54] = 64'hd9e6dbd93a785fa0;
      expv[55] = 64'h2d257370d16636af;
      expv[56] = 64'hfb0e99e71344d9dd;
      expv[57] = 64'h16d1c80d97d48576;
      expv[58] = 64'h0a55cc322cdfe00c;
      expv[59] = 64'h028e00ea3259560f;
      expv[60] = 64'h065bfc729182b900;
      expv[61] = 64'h001e2e9f135b6779;
      expv[62] = 64'hfe243054b619d356;
      expv[63] = 64'h089edd4f566a51e3;
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
