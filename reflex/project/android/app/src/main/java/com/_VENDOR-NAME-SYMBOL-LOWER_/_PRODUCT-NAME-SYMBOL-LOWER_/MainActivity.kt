package com.reflex.reflex

import com.reflex_multimedia.reflex.sdk.ReflexActivity

class MainActivity : ReflexActivity(R.xml.filepaths) {
	companion object {
		init {
			System.loadLibrary("CppLib")
		}
	}
}