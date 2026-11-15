// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 81;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04501 dut (
    .clk(clk),
    .reset(in_vec[80:80]),
    .address(in_vec[79:77]),
    .write(in_vec[76:76]),
    .read(in_vec[75:75]),
    .writedata(in_vec[74:43]),
    .rx_data(in_vec[42:11]),
    .rx_dval(in_vec[10:10]),
    .rx_sop(in_vec[9:9]),
    .rx_eop(in_vec[8:8]),
    .rx_mod(in_vec[7:6]),
    .rx_err(in_vec[5:0]),
    .readdata(out_vec[32:1]),
    .rx_rdy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 81'h163bf457a2b7b1745f74b;
    stim[1] = 81'h1c42cb2ac5f9a07f523cb;
    stim[2] = 81'h02f98b5652fadd4fd19a5;
    stim[3] = 81'h0b6b88c047ec32252b0a8;
    stim[4] = 81'h02e560d01fd6fb3ba86c0;
    stim[5] = 81'h09421a4e01667bc684595;
    stim[6] = 81'h0c6b524a7aa8906030b05;
    stim[7] = 81'h05e13f99c8f90b2757d75;
    stim[8] = 81'h001794bd34d70fb9b2e68;
    stim[9] = 81'h070cc977ae8c4818fc17a;
    stim[10] = 81'h1c6b663a976d8f6df2e27;
    stim[11] = 81'h0865757eee3844c82df8c;
    stim[12] = 81'h012ab9270cd9096ceaa19;
    stim[13] = 81'h006d8014f1bcc2eab632d;
    stim[14] = 81'h0389d9f5957e445171e0b;
    stim[15] = 81'h04c1ae3195a236e8df64f;
    stim[16] = 81'h0db7269ed55fd3e5cc9f1;
    stim[17] = 81'h04d2a462815b4b41476ff;
    stim[18] = 81'h0f4401997fb6d0422ff3f;
    stim[19] = 81'h00679e00ddb8d7266745c;
    stim[20] = 81'h00d9dea7ff5f2c9c599a5;
    stim[21] = 81'h055807503ff5ecded1c52;
    stim[22] = 81'h09b8af1c9bfde96afb1da;
    stim[23] = 81'h0be31777087c99b044986;
    stim[24] = 81'h09ed0edce71245706db79;
    stim[25] = 81'h0ca2f97813c3f3cd63220;
    stim[26] = 81'h0b10b3fff75868cf5ab5b;
    stim[27] = 81'h0c7988b394a401569a47a;
    stim[28] = 81'h0d729028f118ebfc46fee;
    stim[29] = 81'h03713f8505e5ca6682998;
    stim[30] = 81'h0ea54cc5a734796771dc2;
    stim[31] = 81'h0b93cc7bffa9d87e35747;
    stim[32] = 81'h077c71db2472c2ac5010f;
    stim[33] = 81'h0d4a921b5b057a05ebb95;
    stim[34] = 81'h064e762fb26691c42cb1a;
    stim[35] = 81'h0c5e416bfbf99317f0587;
    stim[36] = 81'h00988b8e3c22219c5b503;
    stim[37] = 81'h08aa670bf21e8e5610af1;
    stim[38] = 81'h06c8b5d73916c9b9f0b6e;
    stim[39] = 81'h02e5b4667a48583c643c7;
    stim[40] = 81'h095246899cbeddcc3a318;
    stim[41] = 81'h0cd60df7cf074329251a6;
    stim[42] = 81'h0126f4604cd5a2d30ba08;
    stim[43] = 81'h0e50969292d221b3fafd8;
    stim[44] = 81'h0132cb56af0bf7c5bf604;
    stim[45] = 81'h0bc4e28131632b5d56fb8;
    stim[46] = 81'h0206b1419bd4ec960dc20;
    stim[47] = 81'h0d08c4bae2909f0f211fa;
    stim[48] = 81'h0093772be24359b4b0df2;
    stim[49] = 81'h0347eadc9205cd53ec1ea;
    stim[50] = 81'h0be808fc35db397442142;
    stim[51] = 81'h0ac8662c38634c5ad8372;
    stim[52] = 81'h0cbf0c2bc1f6d4338171a;
    stim[53] = 81'h09831089f533c3f70ff62;
    stim[54] = 81'h0fcd393ac9c11d04579ad;
    stim[55] = 81'h0ce8d2e3b0f130fa46d70;
    stim[56] = 81'h00a879b2a2fd2bb28397c;
    stim[57] = 81'h0197e42a3221a2de21fc6;
    stim[58] = 81'h04ebcfff0f330e6638aba;
    stim[59] = 81'h058c34584ac47586a230b;
    stim[60] = 81'h0b29b1e8e121426937e14;
    stim[61] = 81'h0cb45396a45c8fb234d83;
    stim[62] = 81'h0b67d4cb2ba6b0b60dff6;
    stim[63] = 81'h0872caa6ce2b16b95b647;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000001;
      expv[4] = 33'h000000001;
      expv[5] = 33'h000000001;
      expv[6] = 33'h000000001;
      expv[7] = 33'h000000001;
      expv[8] = 33'h000000001;
      expv[9] = 33'h000000001;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000001;
      expv[13] = 33'h000000001;
      expv[14] = 33'h000000001;
      expv[15] = 33'h000000001;
      expv[16] = 33'h000000001;
      expv[17] = 33'h000000001;
      expv[18] = 33'h000000001;
      expv[19] = 33'h000000001;
      expv[20] = 33'h0aae49c33;
      expv[21] = 33'h000000001;
      expv[22] = 33'h000000001;
      expv[23] = 33'h000000003;
      expv[24] = 33'h000000001;
      expv[25] = 33'h000000001;
      expv[26] = 33'h000000001;
      expv[27] = 33'h000000001;
      expv[28] = 33'h000000001;
      expv[29] = 33'h000000001;
      expv[30] = 33'h000000301;
      expv[31] = 33'h000000013;
      expv[32] = 33'h000000001;
      expv[33] = 33'h000000001;
      expv[34] = 33'h000000001;
      expv[35] = 33'h000000001;
      expv[36] = 33'h0aae49c33;
      expv[37] = 33'h000000001;
      expv[38] = 33'h000000027;
      expv[39] = 33'h000000001;
      expv[40] = 33'h000000001;
      expv[41] = 33'h000000001;
      expv[42] = 33'h000000001;
      expv[43] = 33'h000000001;
      expv[44] = 33'h000000001;
      expv[45] = 33'h00000002f;
      expv[46] = 33'h000000001;
      expv[47] = 33'h000000001;
      expv[48] = 33'h0cb2d5abd;
      expv[49] = 33'h000000001;
      expv[50] = 33'h000000039;
      expv[51] = 33'h00000003b;
      expv[52] = 33'h000000001;
      expv[53] = 33'h000000001;
      expv[54] = 33'h000000441;
      expv[55] = 33'h000000001;
      expv[56] = 33'h0cb2d5abd;
      expv[57] = 33'h0cb2d5abd;
      expv[58] = 33'h000000001;
      expv[59] = 33'h000000001;
      expv[60] = 33'h000000001;
      expv[61] = 33'h000000001;
      expv[62] = 33'h000000001;
      expv[63] = 33'h000000001;
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
