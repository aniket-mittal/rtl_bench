// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 129;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_005490 dut (
    .shiftRow_valid_in(in_vec[128:128]),
    .shiftRow_data_in(in_vec[127:0]),
    .shiftRow_data_out(out_vec[128:1]),
    .shiftRow_valid_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h140ecc8febeafe627ca7898c880c87b60;
    stim[1] = 129'h1fd482711c16f21f2ed3c599055c90e09;
    stim[2] = 129'h151c838c727245d50945b8d47023b2459;
    stim[3] = 129'h06d6f25715217f79c77a4a567f892a3c4;
    stim[4] = 129'h1d72b772d80db9281b01a40d506292254;
    stim[5] = 129'h10c67fa0f77353197f2691cd6bb4e6a85;
    stim[6] = 129'h14360ed14b1a329b507a97ccdacf111c2;
    stim[7] = 129'h1b789439f05690827ef4df349782e98af;
    stim[8] = 129'h0f08bf6bcea8974a52a99c83c047e35f2;
    stim[9] = 129'h022659e9dd0e11442b88e9dbe4e10a559;
    stim[10] = 129'h17509f6779f28f1287b374a5999bafff6;
    stim[11] = 129'h04b385cb9733a5f4b979f8e0fa8a5bb87;
    stim[12] = 129'h1ed6c3bd40d9cc9ab2479d9b2d067a641;
    stim[13] = 129'h0c86e1cd87aa4fa7cf80616d0bf21c734;
    stim[14] = 129'h14696847fe1b3b000546af533acc00f2d;
    stim[15] = 129'h139b5d0f76fbbd55152775697f1dff4da;
    stim[16] = 129'h119f46da381ae9ea4ac7f605e6a2ddef4;
    stim[17] = 129'h11d7f7364c3805bfa9a96ca1463b7da23;
    stim[18] = 129'h15785b93dd3bad86043043c6cec7f2fec;
    stim[19] = 129'h0708fd99cadf957067d62b8aa8b983f5d;
    stim[20] = 129'h17543af75b6ace19b7d1a9f8629524406;
    stim[21] = 129'h1d429fc111cd0b246fd93717ac1ab9835;
    stim[22] = 129'h0f6274006f247971df0fae74eb2ecd620;
    stim[23] = 129'h08d2a5f6bedd718d7f774f0ff8df295ab;
    stim[24] = 129'h022d4cf4836622d0a0e9b810a70890a45;
    stim[25] = 129'h1e54a1837dfb44fe0079317855d0e1b3f;
    stim[26] = 129'h184551f40f66cc23ba443560e113ad7fd;
    stim[27] = 129'h0f86170c0862e50b55113b405314f3e80;
    stim[28] = 129'h02eb2a183dc531549b00a09500f6e75e2;
    stim[29] = 129'h12ffb952078d8b11ec6debba1059bc836;
    stim[30] = 129'h0d77595e19cba592e610901e8ba65fe30;
    stim[31] = 129'h17864bf1a7a94598b1dfb67af91a2e0d6;
    stim[32] = 129'h09d4248b22c8d4988883f483ed83c735d;
    stim[33] = 129'h13f73ec2df68536725616af8aef20134b;
    stim[34] = 129'h0fa474988f7aa690dbbadd85e513943a9;
    stim[35] = 129'h0c3a5fa129da8b4b11e422f5049e9ae0d;
    stim[36] = 129'h0bf60c65512f9a8b93065f88838c8cbae;
    stim[37] = 129'h12eb47b8927ee604e6c91f37c5f49495f;
    stim[38] = 129'h1e488fb211eb6bed57b3688e85054fbb2;
    stim[39] = 129'h195ce62707355901ee31cea5826cac82d;
    stim[40] = 129'h1d02c550fc3862ae91bb3465c2834f3cf;
    stim[41] = 129'h04d58548b8e48295fc61656edcc6db178;
    stim[42] = 129'h115daf93b40052b78e19bbb782811c4f5;
    stim[43] = 129'h0ae15b85fcb8a1e29e4089bac507da449;
    stim[44] = 129'h03df2662c3e5ed3c96d9a39dc1b59d685;
    stim[45] = 129'h07e9772857be1c18993baba6747dde745;
    stim[46] = 129'h065b989f175d17c99c838ac773d5f5cf1;
    stim[47] = 129'h1cc06e9c627c918d28bf7a3e9b9e9251b;
    stim[48] = 129'h1dd386e9fc9215b39d3e26e4e3fd18953;
    stim[49] = 129'h02e4f1339b2ac501583e532e5179948ac;
    stim[50] = 129'h07d5ea96e32098ccb28c9436d9062feaf;
    stim[51] = 129'h192f4654998540ec5048fddc45149d019;
    stim[52] = 129'h0db622546de99b90304c5479e68c482cf;
    stim[53] = 129'h19284ec5e6a79ef66c1a0808028e7ffe9;
    stim[54] = 129'h1cb822872d13a19c8a8bc6364dd4808f9;
    stim[55] = 129'h1cc32c1b2491a578fcd394410842257f7;
    stim[56] = 129'h07e393158901347e605a4ec47542b2db2;
    stim[57] = 129'h0294c24cdcaf7b5ec96ac1f521e9b06b6;
    stim[58] = 129'h15bfe068c01c34c67a19a2c44d585053c;
    stim[59] = 129'h09eed6b3e0adfd070a458ddd92a30de0d;
    stim[60] = 129'h0b13cbbd9451a6ce907aab8eb08d76240;
    stim[61] = 129'h0701219ac7aa911d976828c638507a40d;
    stim[62] = 129'h15595df88fa88acd1c13960d8f9289c06;
    stim[63] = 129'h1fb288bb989b5cebc6be4ba06b38a2ca1;
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
      expv[0] = 129'h081d991fd5fcc4f7d319194f0c10190f7;
      expv[1] = 129'h1fa904e22de43e582b321da7812ab921d;
      expv[2] = 129'h0a390718e48baa04f1a8f28b6b2047649;
      expv[3] = 129'h000000000000000000000000000000000;
      expv[4] = 129'h1ae56ee5bb725030081ab6034a80c5245;
      expv[5] = 129'h018cff41e6a632eee39ade4d30b769cd5;
      expv[6] = 129'h086c1da2946536b62f99a0f538559e223;
      expv[7] = 129'h16f12873ed2104e0be693de9b5ef05d31;
      expv[8] = 129'h000000000000000000000000000000000;
      expv[9] = 129'h000000000000000000000000000000000;
      expv[10] = 129'h0ea13ecee51e2513e94b2f66fed3375ff;
      expv[11] = 129'h000000000000000000000000000000000;
      expv[12] = 129'h1dad877a93993561bb36448f283a0cf4d;
      expv[13] = 129'h000000000000000000000000000000000;
      expv[14] = 129'h08d2d08ff676001c3ea66a8d45b59801f;
      expv[15] = 129'h0736ba1ef77aaa2dead2ea4efb5e3bfe9;
      expv[16] = 129'h033e8db475d3d4902c0bd58ffe8d45bbd;
      expv[17] = 129'h03afee6c900b7f5879429352c46c76fb5;
      expv[18] = 129'h0af0b727b75b0c1a678d88609d9d8fe5f;
      expv[19] = 129'h000000000000000000000000000000000;
      expv[20] = 129'h0ea875eeb59c3376d3f0cfa340c52a489;
      expv[21] = 129'h1a853f823a1648c38e2f5fb266b835731;
      expv[22] = 129'h000000000000000000000000000000000;
      expv[23] = 129'h000000000000000000000000000000000;
      expv[24] = 129'h000000000000000000000000000000000;
      expv[25] = 129'h1ca94306f689fc1be2f0a0f267eba1c37;
      expv[26] = 129'h108aa3e80d98477ecac1d4887fa2275af;
      expv[27] = 129'h000000000000000000000000000000000;
      expv[28] = 129'h000000000000000000000000000000000;
      expv[29] = 129'h05ff72a41b1623cf177438dbc6c0b3791;
      expv[30] = 129'h000000000000000000000000000000000;
      expv[31] = 129'h0f0c97e3528b316f4cf5e3bf7ad2345c1;
      expv[32] = 129'h000000000000000000000000000000000;
      expv[33] = 129'h07ee7d85b0a6ce5ed5f14ac2c97de4027;
      expv[34] = 129'h000000000000000000000000000000000;
      expv[35] = 129'h000000000000000000000000000000000;
      expv[36] = 129'h000000000000000000000000000000000;
      expv[37] = 129'h05d68f713dcc09c4fe6f8d922bebe9293;
      expv[38] = 129'h1c911f6436d7daa3d11d0f66d64a0a9f7;
      expv[39] = 129'h12b9cc4e0ab203ce7d4b1c6385a4d9591;
      expv[40] = 129'h1a058aa1f0c55d3868cb837679e5069e7;
      expv[41] = 129'h000000000000000000000000000000000;
      expv[42] = 129'h02bb5f2760a56f08176f1c337ea502389;
      expv[43] = 129'h000000000000000000000000000000000;
      expv[44] = 129'h000000000000000000000000000000000;
      expv[45] = 129'h000000000000000000000000000000000;
      expv[46] = 129'h000000000000000000000000000000000;
      expv[47] = 129'h1980dd38d9231a44f47d317ee3773d24b;
      expv[48] = 129'h1ba70dd3e42b67392dc9da7c4a67fa313;
      expv[49] = 129'h000000000000000000000000000000000;
      expv[50] = 129'h000000000000000000000000000000000;
      expv[51] = 129'h125e8ca92a81d8b31bb88091e32a293a1;
      expv[52] = 129'h000000000000000000000000000000000;
      expv[53] = 129'h12509d8bcf3deccd501018341d251cfff;
      expv[54] = 129'h1970450e4743391a2c6c95179f3ba9011;
      expv[55] = 129'h19865836434af1e9288219a73ef0844af;
      expv[56] = 129'h000000000000000000000000000000000;
      expv[57] = 129'h000000000000000000000000000000000;
      expv[58] = 129'h0b7fc0d198698ce025889433479ab0a0b;
      expv[59] = 129'h000000000000000000000000000000000;
      expv[60] = 129'h000000000000000000000000000000000;
      expv[61] = 129'h000000000000000000000000000000000;
      expv[62] = 129'h0ab2bbf111159a3f4c1b182720df25139;
      expv[63] = 129'h1f65117736b9d7913740cd7c943671459;
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
