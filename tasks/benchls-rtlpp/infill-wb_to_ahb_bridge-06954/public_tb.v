// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 111;
  localparam OW = 113;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06954 dut (
    .clk_i(clk),
    .rst_n_i(in_vec[110:110]),
    .from_m_wb_adr_o(in_vec[109:78]),
    .from_m_wb_sel_o(in_vec[77:74]),
    .from_m_wb_we_o(in_vec[73:73]),
    .from_m_wb_dat_o(in_vec[72:41]),
    .from_m_wb_cyc_o(in_vec[40:40]),
    .from_m_wb_stb_o(in_vec[39:39]),
    .from_m_wb_cti_o(in_vec[38:36]),
    .from_m_wb_bte_o(in_vec[35:34]),
    .mHRDATA(in_vec[33:2]),
    .mHRESP(in_vec[1:1]),
    .mHREADY(in_vec[0:0]),
    .to_m_wb_ack_i(out_vec[112:112]),
    .to_m_wb_err_i(out_vec[111:111]),
    .to_m_wb_dat_i(out_vec[110:79]),
    .mHSEL(out_vec[78:78]),
    .mHSIZE(out_vec[77:75]),
    .mHREADYOUT(out_vec[74:74]),
    .mHWRITE(out_vec[73:73]),
    .mHBURST(out_vec[72:70]),
    .mHADDR(out_vec[69:38]),
    .mHTRANS(out_vec[37:36]),
    .mHWDATA(out_vec[35:4]),
    .mHPROT(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 111'h690e1ade9aa6d13158bd6333f9d6;
    stim[1] = 111'h5fe031aee00e8938b82f08aee88b;
    stim[2] = 111'h36a45c49eb17149e6a60b18c244d;
    stim[3] = 111'h0433c47ca83644feb295edac6909;
    stim[4] = 111'h070cce6c94f11eeabf85a556d605;
    stim[5] = 111'h3c5e3df3849813d9fe6ae1cefde8;
    stim[6] = 111'h05e4d1ccb682c4ee28e9b41d137b;
    stim[7] = 111'h18f7c92aef4ed6eddacec2b77fa1;
    stim[8] = 111'h146b8df1931db2ee2386f3a204d3;
    stim[9] = 111'h3dfb8ff94fb6ec8cce1e046297b3;
    stim[10] = 111'h1eccee64ce0116907b1b5e356c87;
    stim[11] = 111'h11799e5291ca9f82ca0fcad7d78c;
    stim[12] = 111'h0fece3d7afb8473170a3951c7350;
    stim[13] = 111'h2bc94c43890accea640800595ac6;
    stim[14] = 111'h2b1b556786b0aee27a9ee8ed2cde;
    stim[15] = 111'h34308f1cff52daefcf3d5a4c47ee;
    stim[16] = 111'h256e685b56e01e3b6a8c5ab94a46;
    stim[17] = 111'h28537acd85c5e1a8fe91b60230e2;
    stim[18] = 111'h1576185a820eaecac55eb64f9e23;
    stim[19] = 111'h399ccc8162f847380688ea402b79;
    stim[20] = 111'h15cdfb69b53d45af8a1e055fd844;
    stim[21] = 111'h225dfcb8d64250ce2d30ee97dd80;
    stim[22] = 111'h27de40902c90dfdcc6b8dd810c95;
    stim[23] = 111'h0434ce5353195c6ffab5c26c285e;
    stim[24] = 111'h2c97f7bcc69c40ef7839cf8ae230;
    stim[25] = 111'h1d8f802312abc27edfdb05811f58;
    stim[26] = 111'h1cc2ce3704d336be25b2e9f1059f;
    stim[27] = 111'h31c8714c9d5d8c7b644f90b67ae9;
    stim[28] = 111'h228ad1bf2d2d3f9adaf9b7fb2f8e;
    stim[29] = 111'h1fac6cccc1a6dbacf0aff2bc5972;
    stim[30] = 111'h2bb9bcbe8127c5c8491ef335317f;
    stim[31] = 111'h217af82b1df19c9a9d8159e03624;
    stim[32] = 111'h3cc4d63be853f569df2e147be2a9;
    stim[33] = 111'h1b1cdef0f4aac70b6f8b5d19b703;
    stim[34] = 111'h3943340cac70dcf9e234bd3e3ea6;
    stim[35] = 111'h26893de97836f0511eda04d92f61;
    stim[36] = 111'h36511cd279bc896ea1704fb8bc55;
    stim[37] = 111'h0698c1360e523ed696874a34e781;
    stim[38] = 111'h34df94cd96d62982461af1701b87;
    stim[39] = 111'h25a0201df8b75d9e1f434aa6eb74;
    stim[40] = 111'h2aae122967eabbd3040c624d158a;
    stim[41] = 111'h1b5ce858c4f36d2a51febe6ee59e;
    stim[42] = 111'h3ec040e1a138b5b62fd74518b793;
    stim[43] = 111'h314366741039484da71e2a2e30fa;
    stim[44] = 111'h2e31b783367f007dc59fad0498bc;
    stim[45] = 111'h13b4ca153aeb2e513ca55086930b;
    stim[46] = 111'h0058ab7fcb55fbaa69c49bac79ea;
    stim[47] = 111'h387c49a9c87dc67a176228dd52d7;
    stim[48] = 111'h085acffd4f660c7f9015a85f8994;
    stim[49] = 111'h3510ea4777d3972342bf27e857d8;
    stim[50] = 111'h03c570f7af91fe2ea7e687cf9f37;
    stim[51] = 111'h39c3272d65e2e50c16f0e7659c3a;
    stim[52] = 111'h1ad5ae01d5409513d9008f2102f8;
    stim[53] = 111'h15aa289ac6355c227354c1a28f39;
    stim[54] = 111'h36e95151e92526b3cac237fa9cce;
    stim[55] = 111'h0c490395afb10120b4307ab54af5;
    stim[56] = 111'h34ddbbb573305fc069be6fc5d22e;
    stim[57] = 111'h078ed7bab54a6f9e405a113651ef;
    stim[58] = 111'h3e74a8d1d262d65319a2141ed407;
    stim[59] = 111'h1548068fdfbfe1724320f90b4d35;
    stim[60] = 111'h1e598394fa0e24782f912025df04;
    stim[61] = 111'h1c21e34f87f36739f55f510bbf75;
    stim[62] = 111'h1f3b0510c21430358ce5950617b3;
    stim[63] = 111'h25aada9879ddeff4d2da1efcf8f2;
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
      expv[0] = 113'h0ac667f3a96290e1ade8536898acx;
      expv[1] = 113'h0e115dd11141fe031aec07449c5cx;
      expv[2] = 113'h0163184899636a45c49c8b8a4f35x;
      expv[3] = 113'h03db58d21140433c47c81b227f59x;
      expv[4] = 113'h034aadac0d4070cce6c8788f755fx;
      expv[5] = 113'h05c39dfbd143c5e3df384c09ecffx;
      expv[6] = 113'h0b683a26f1605e4d1cc841627714x;
      expv[7] = 113'h05856eff41618f7c92aca76b76edx;
      expv[8] = 113'h0de74409a56146b8df188ed97711x;
      expv[9] = 113'h0c08c52f6163dfb8ff94db764667x;
      expv[10] = 113'h0ebc6ad90d61eccee64c008b483dx;
      expv[11] = 113'h0795afaf19411799e528e54fc165x;
      expv[12] = 113'h072a38e6a160fece3d78dc2398b8x;
      expv[13] = 113'h0800b2b58942bc94c43885667532x;
      expv[14] = 113'h0dd1da59b962b1b556785857713dx;
      expv[15] = 113'h0ab4988fdd634308f1cca96d77e7x;
      expv[16] = 113'h08b57294896256e685b4700f1db5x;
      expv[17] = 113'h0b6c0461c1428537acd8e2f0d47fx;
      expv[18] = 113'h0d6c9f3c4561576185a807576562x;
      expv[19] = 113'h01d48056f16399ccc8147c239c03x;
      expv[20] = 113'h040abfb089415cdfb6989ea2d7c5x;
      expv[21] = 113'h01dd2fbb056225dfcb8c21286716x;
      expv[22] = 113'h01bb021929427de40900486fee63x;
      expv[23] = 113'h0b84d850b960434ce5348cae37fdx;
      expv[24] = 113'h039f15c46162c97f7bcc4e2077bcx;
      expv[25] = 113'h060b023eb561d8f8023055e13f6fx;
      expv[26] = 113'h0dd3e20b3d41cc2ce370699b5f12x;
      expv[27] = 113'h07216cf5d1431c8714c8aec63db2x;
      expv[28] = 113'h0b6ff65f194228ad1bf0969fcd6dx;
      expv[29] = 113'h0fe578b2e141fac6ccccd36dd678x;
      expv[30] = 113'h0de66a62fd42bb9bcbe893e2e424x;
      expv[31] = 113'h02b3c06c4d4217af82b0f8ce4d4ex;
      expv[32] = 113'h0428f7c55543cc4d63bc29fab4efx;
      expv[33] = 113'h0eba336e0541b1cdef0c556385b7x;
      expv[34] = 113'h097a7c7d4943943340c8386e7cf1x;
      expv[35] = 113'h0409b25ec1426893de941b78288fx;
      expv[36] = 113'h009f7178ad436511cd24de44b750x;
      expv[37] = 113'h069469cf0160698c1360291f6b4bx;
      expv[38] = 113'h0de2e03709634df94cd86b14c123x;
      expv[39] = 113'h06954dd6ed425a0201dc5baecf0fx;
      expv[40] = 113'h08c49a2b1162aae12294f55de982x;
      expv[41] = 113'h0d7cddcb3d41b5ce858c79b69528x;
      expv[42] = 113'h0e8a316f2543ec040e189c5adb17x;
      expv[43] = 113'h0c545c61f543143667401ca426d3x;
      expv[44] = 113'h075a09317d62e31b78303f803ee2x;
      expv[45] = 113'h0aa10d2611613b4ca1507597289ex;
      expv[46] = 113'h093758f3d560058ab7fcaafdd534x;
      expv[47] = 113'h0c51baa5ad4387c49a9c3ee33d0bx;
      expv[48] = 113'h0350bf13296085acffd4b3063fc8x;
      expv[49] = 113'h064fd0afb163510ea474e9cb91a1x;
      expv[50] = 113'h0d0f9f3e6d603c570f78c8ff1753x;
      expv[51] = 113'h09cecb3871439c3272d4f172860bx;
      expv[52] = 113'h011e4205f541ad5ae01ca04a89ecx;
      expv[53] = 113'h0183451e75615aa289ac1aae1139x;
      expv[54] = 113'h0c6ff53999436e95151c929359e5x;
      expv[55] = 113'h00f56a95e960c4903958d880905ax;
      expv[56] = 113'h0cdf8ba45d634ddbbb54982fe034x;
      expv[57] = 113'h0c226ca3d94078ed7ba8a537cf20x;
      expv[58] = 113'h0c283da80d63e74a8d1c316b298cx;
      expv[59] = 113'h01f2169a6d61548068fcdff0b921x;
      expv[60] = 113'h02404bbe0d61e598394c07123c17x;
      expv[61] = 113'h06a2177eed61c21e34f8f9b39cfax;
      expv[62] = 113'h0b2a0c2f6161f3b0510c0a181ac6x;
      expv[63] = 113'h0c3df9f1e1425aada984eef7fa69x;
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
