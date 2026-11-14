// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 300;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[99:0]),
    .out_both(out_vec[299:200]),
    .out_any(out_vec[199:100]),
    .out_different(out_vec[99:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h0594639ea4b2cd53688e990fb;
    stim[1] = 100'h150ecfc9a25899488e302e4c1;
    stim[2] = 100'h0b1ef60ce04cdb121b2f4d879;
    stim[3] = 100'h5053d2059d53445ddb99f4d19;
    stim[4] = 100'hfb020d23fdf18efd72f2bc029;
    stim[5] = 100'h8467d961ae626fc63e5018d93;
    stim[6] = 100'h5e0ea9eaf34f7222b71eca0ba;
    stim[7] = 100'hd1294ad939664660bf2a1cf3b;
    stim[8] = 100'h0c43fd032df37f3cdffa600d7;
    stim[9] = 100'h2c9baeea8b0a49d088f4c6764;
    stim[10] = 100'h219c87c4b392cb9b3c8f9059a;
    stim[11] = 100'h10379a39a6639b04a153d4529;
    stim[12] = 100'h0b7c56a0020821a056d32bd59;
    stim[13] = 100'h78a112d5cc198bd5ceaaca7d7;
    stim[14] = 100'he9c3e2c6a509c38892d3d6471;
    stim[15] = 100'hd515407d20454ce100f85fca8;
    stim[16] = 100'h95bcd88219881d9b4b637669e;
    stim[17] = 100'hfdaf4b7bc3b71275bb1555a12;
    stim[18] = 100'h0d73b85e7a440b80e5038771d;
    stim[19] = 100'h392e9028285b0dc5e7ae73437;
    stim[20] = 100'hc8e415988d706a8e03aa21685;
    stim[21] = 100'hbcc706d86ac5960cdc5984bda;
    stim[22] = 100'h3c63d91522de7f9eb042e5df8;
    stim[23] = 100'h1eae19eb700b5f7be1583e6fe;
    stim[24] = 100'h9f83103c2c480469a62aaad2c;
    stim[25] = 100'hd2235cbea0a5cb9a415a05ff6;
    stim[26] = 100'h8cf08f842b063503ff35cf1c8;
    stim[27] = 100'h398e19ef61e6ffc1689779672;
    stim[28] = 100'hd7ade50f90f287b1c92fb82e1;
    stim[29] = 100'hc353a052d1c2e3257ec385bb7;
    stim[30] = 100'h0a6003c7921ab1efe61431523;
    stim[31] = 100'h6e316edcab7651af65fe31419;
    stim[32] = 100'h9f8b7e9e46c277f11ffb1cf49;
    stim[33] = 100'h48189c1e0d5ef618acf124491;
    stim[34] = 100'h554138d1fee9b31f709eb1285;
    stim[35] = 100'h7988069702b8305e88e6243c9;
    stim[36] = 100'hf881153f8535b8a9aaabb1067;
    stim[37] = 100'ha0c6fca9a4e652305bdebe864;
    stim[38] = 100'h6720d88c465e08e90e12b177d;
    stim[39] = 100'h4d0f634d482bbae3cc7641218;
    stim[40] = 100'h6b1765a0d529926d44eaf7b77;
    stim[41] = 100'hd7941eaa93fa3c2a5984bcbd1;
    stim[42] = 100'h46bbfbee1657f11f4b0a86b4a;
    stim[43] = 100'hfd373359bc4d4124ba2112c6c;
    stim[44] = 100'h7ae01095ef287663629a177f7;
    stim[45] = 100'hc702a910673737071bdc4c33d;
    stim[46] = 100'h10129dfdf7147aa238bd28af8;
    stim[47] = 100'h7b4f7201b8415a9699c8cc1fa;
    stim[48] = 100'h2908899b640a9341886a77354;
    stim[49] = 100'hab4a6d7f5f174fca33f66817d;
    stim[50] = 100'h2669dbd6e71dc2eef2e6613f7;
    stim[51] = 100'hc59a6481f5e7095e65356ad93;
    stim[52] = 100'h6b02b47a42a9d2ddb6ea9a8fd;
    stim[53] = 100'haeebef020f3912b062b7e23e6;
    stim[54] = 100'h8a418b72db638728b156d0581;
    stim[55] = 100'h240dd769cbd89cb528fa44b28;
    stim[56] = 100'h5262a34ab50ed8c2a647be203;
    stim[57] = 100'h6538cf3c539308f1ba86b3bbf;
    stim[58] = 100'h6f45fa3b0fdf8358eef469ebc;
    stim[59] = 100'hbb505a0228cf8df9390dd706d;
    stim[60] = 100'h91139dc0ba07362f1c8cf7957;
    stim[61] = 100'haca5983aa11c0766a5bc59127;
    stim[62] = 100'h71aaf012ad6dcc24d699676c0;
    stim[63] = 100'h402eb95475fc6f149b1a71a96;
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
      expv[0] = 300'h0594639ea4b2cd53688e990fb0fbce7bfedf7dff7f99fbb1fe875e5251f6ebabfadcc9d5886;
      expv[1] = 300'h150ecfc9a25899488e302e4c13f1fdfdbe6f9bbd99e707edc29f89a82d7374d5ecc928396a1;
      expv[2] = 300'h0b1ef60ce04cdb121b2f4d8791f3ffe1de0ddff363f7fdf8fa8e918d0a906ab69b16b8eb445;
      expv[3] = 300'h5053d2059d53445ddb99f4d19f0f7f60fbff7ccffffbbfdf3af87a3b0753fae67336550eb95;
      expv[4] = 300'h7b020d23fdf18efd72f2bc029ff061f67fff39ffff7f7fc07a06830bb203094983cb8be203d;
      expv[5] = 300'h0467d961ae626fc63e5018d938ceffbe3fee6ffce7ef039fb6465435d179535825217814b5a;
      expv[6] = 300'h5e0ea9eaf34f7222b71eca0bafe1ffbfff7dff667ff3fde1fe7109fd1f8ae8cb33ec91af0e7;
      expv[7] = 300'h51294ad939664660bf2a1cf3bf37bdffb7beecee1ff7e3df7e39bdefb5a5d56550e0bf128a6;
      expv[8] = 300'h0c43fd032df37f3cdffa600d71cc7ff077ff7ff7dfffee01fe8a620382bb0ac0a2b007500bc;
      expv[9] = 300'h2c9baeea8b0a49d088f4c67647dbfffff9f1edbf199fdcefec3ad6799fce8f6d38cc8ea54d6;
      expv[10] = 300'h219c87c4b392cb9b3c8f9059a63bd8fcdf7b7dfbf7d9fb0fbe3152c426ea5bae56a2c858757;
      expv[11] = 300'h10379a39a6639b04a153d4529307fbe7beee7bf0de3f7fcf7a982c572575525686f1fa3e7bd;
      expv[12] = 300'h0b7c56a0020821a056d32bd591ffcffe0061863e0fff77fffa8ec27df0030c31707dbabe3f5;
      expv[13] = 300'h78a112d5cc198bd5ceaaca7d7f9e337ffdc3b9fffdfffdeffec4f19bbf2a154e3f29ffaf43c;
      expv[14] = 300'h69c3e2c6a509c38892d3d6471fbc7e7cfef1bc799b7f7fecf21d2213a5f78d224cdbba3d649;
      expv[15] = 300'h5515407d20454ce100f85fca8ff3fc0ff60cfdde301f8ffdf8bf9fe043b067ea918084702fc;
      expv[16] = 300'h15bcd88219881d9b4b637669ebffdf9863b983fbfdfe7fefbedf62b4c3154c1356eed2cd5d1;
      expv[17] = 300'h7daf4b7bc3b71275bb1555a12ffffdfffc7ff36ffff3fffe368378eec6226c9b4f669fff71b;
      expv[18] = 300'h0d73b85e7a440b80e5038771d1ff7f8fefecc1f81ef078ff3e8bca647147660e40978244c93;
      expv[19] = 300'h392e9028285b0dc5e7ae734377b7fb07878ff1fcfeffef7c7ea5b9d83c3c768b2714794ae2c;
      expv[20] = 300'h48e415988d706a8e03aa21685d9ec3fb99ff0ff9e07fe63f8e2c961f54cbc85fc9027f31dc7;
      expv[21] = 300'h3cc706d86ac5960cdc5984bdafdcf0ff8ffcfbe1dfcfb8dffee2a485b45fa75d0ab27546e37;
      expv[22] = 300'h3c63d91522de7f9eb042e5df87ce7fb3f67feffbff0c7efff82252359fb3b14051e86397304;
      expv[23] = 300'h1eae19eb700b5f7be1583e6fe3ffe3bfff01fffffe3f87effe11f9151ec80ef0c611f421581;
      expv[24] = 300'h1f83103c2c480469a62aaad2cbf87307c7cd80cfbee7ffff7cd04298223a6c065d753fffbba;
      expv[25] = 300'h52235cbea0a5cb9a415a05ff6f667fdffe1efdfbec3fe0fffebb32f2e1f0f72e5761f70700d;
      expv[26] = 300'h0cf08f842b063503ff35cf1c89df19f8c7f0e7f07ff7fdf3d8ca88c8463e852f8200af2892c;
      expv[27] = 300'h398e19ef61e6ffc16897796727b9e3bffe3efffc3f9bffbef625491518d1158021dcdcc5d4b;
      expv[28] = 300'h57ade50f90f287b1c92fb82e1ffffef1fb1f78ff3db7ff87e23c7b1788588bc4692db864391;
      expv[29] = 300'h4353a052d1c2e3257ec385bb7c7f7e0f7f3c7e76fffc78fffe22fa707bb92392b7c1a24766c;
      expv[30] = 300'h0a6003c7921ab1efe614315231ee007cfb63ff3ffee3c73f668f5002245b17e918151e29fb2;
      expv[31] = 300'h6e316edcab7651af65fe31419fe73fffdfffef3ffeffe73c3ad929d9b2fecd7978d70129e15;
      expv[32] = 300'h1f8b7e9e46c277f11ffb1cf49bf9fffbecfc6fff33fff3dfda504ec1d165a34c099006928ed;
      expv[33] = 300'h48189c1e0d5ef618acf124491d839bc3e1ffffe39fdf36cdb2ec14d2110bf18d14fa89b66d9;
      expv[34] = 300'h554138d1fee9b31f709eb1285ffc379f3fffbf73ff1bff378effe1a4b9019d6a90c8d1e9bc7;
      expv[35] = 300'h7988069702b8305e88e6243c9fb980fbf07f870ff99ee6c7dac54c05dc83e42871cc953622d;
      expv[36] = 300'h7881153f8535b8a9aaabb1067f9833f7f8f7ff9fbfffff30ee04c19fa047af64fd7ffe69854;
      expv[37] = 300'h20c6fca9a4e652305bdebe864e1cffdfbedeef670ffffff8ecf0a582fd76957b287631e1c56;
      expv[38] = 300'h6720d88c465e08e90e12b177def61f99ccefe19fb1e37f3ffed4b0b4ca65710c9d891be9cc3;
      expv[39] = 300'h4d0f634d482bbae3cc7641218df1fe7dfd87fffe7dcfec36386b88d2ebec3e67922a4d61b14;
      expv[40] = 300'h6b1765a0d529926d44eaf7b77ff3fefe1ff7bb6ffcdffffffede9cd770bfbd5b5be69f8c6cc;
      expv[41] = 300'h57941eaa93fa3c2a5984bcbd1ffbc3fffb7fe7c7efb8dfdff23c5e11ffda07223f7546e2e39;
      expv[42] = 300'h46bbfbee1657f11f4b0a86b4acffffffe3efff33fdf1f8ffde65e606191d7c0990ee8fc5eef;
      expv[43] = 300'h7d373359bc4d4124ba2112c6cff7f77fbfcdfc36dfe6337cfc83acaaf5626be1b6e7319ba5a;
      expv[44] = 300'h7ae01095ef287663629a177f7ffe031bfff78fee7e7be3fffec79018df18bc4d52d3d71cc0c;
      expv[45] = 300'h4702a910673737071bdc4c33dcf07fb30ef7f7f0f3ffcdc77e2483fd9854acac8496326a2a3;
      expv[46] = 300'h10129dfdf7147aa238bd28af83037bfffff3cffe679ff79ff8181bd3030c9e47f324e3bcf84;
      expv[47] = 300'h7b4f7201b8415a9699c8cc1faffdff603f8c3ffbfbbd9dc3fe46e8cb016461f7ddd52caa107;
      expv[48] = 300'h2908899b640a9341886a773547b199bbfec1fb7c398feff7fc3d8ccd56d60fdae14c5f4cafe;
      expv[49] = 300'h2b4a6d7f5f174fca33f66817dffdeffffff3fdfde77fef83fe7eef5bc0f09ce82f2a0d5c1c3;
      expv[50] = 300'h2669dbd6e71dc2eef2e6613f76efbffffef3fc7fff7eee37feb55d363d949323998b9551a0c;
      expv[51] = 300'h459a6481f5e7095e65356ad93cfbeed83ffef1bfeef7ffffb6275756c10f148df157afdfb5a;
      expv[52] = 300'h6b02b47a42a9d2ddb6ea9a8fdff07fcfec7fbf7ffffffbf9fede83ee4763fd3bb36d9fd7c83;
      expv[53] = 300'h2eebef020f3912b062b7e23e6ffffff061f7b37f0e7ffe67eef99e188308a59be853ec13215;
      expv[54] = 300'h0a418b72db638728b156d05819ec39ff7ffe78f79f3fff0f824f614ecbb6d244bce9fdb8741;
      expv[55] = 300'h240dd769cbd89cb528fa44b286c1ffffbdff9bdff79fecdf78360b3cdd2e34d2efbc8766ebc;
      expv[56] = 300'h5262a34ab50ed8c2a647be203f6e7e7dfff1ff9c7eecffe606fb53f2efef89b4a3f56461302;
      expv[57] = 300'h6538cf3c539308f1ba86b3bbfef79df7cf7b719f3ff8ff7ffed7a4a8a27a5a8c8967c5ea660;
      expv[58] = 300'h6f45fa3b0fdf8358eef469ebcffcffe7f1fff87f9fffcfbffc58e70726883042f4998e5d1e2;
      expv[59] = 300'h3b505a0228cf8df9390dd706dfff0fe0679df9ffb7b1fff0fe66f877033ca84b05a58b3c85b;
      expv[60] = 300'h11139dc0ba07362f1c8cf7957b337bfc1fe0f7e7f3d9dffbfe599a5320e704ad3892ca8c5fc;
      expv[61] = 300'h2ca5983aa11c0766a5bc59127fdefb87fe33c0fefeffcfb36e7af75427f19204d5f762759b4;
      expv[62] = 300'h71aaf012ad6dcc24d699676c0f3fff037ffffdc6dffbbeffc0497f881bfbdb2a36bdd5d4da0;
      expv[63] = 300'h402eb95475fc6f149b1a71a96c07ffbfcfffcff3dbf3ef3fbe6039e5fe4f02589ed697497dd;
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
