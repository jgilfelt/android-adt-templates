package ${packageName};

import android.os.Parcel;
import android.os.Parcelable;

public class ${objectKind} implements Parcelable {

	// TODO declare your real class members 
	// Members must be either primitives, primitive arrays or parcelables
	private int mFoo;
	private String mBar;
	
	// TODO implement your constructors, getters & setters, methods
	
	private ${objectKind}(Parcel in) {
		// TODO read your class members from the parcel
		// Note: order is important - you must read in the same order
		// you write in writeToParcel!
		mFoo = in.readInt();
		mBar = in.readString();
	}
	
	@Override
	public void writeToParcel(Parcel out, int flags) {
		// TODO write your class members to the parcel
		// Note: order is important - you must write in the same order
		// you read in your private parcelable constructor!
		out.writeInt(mFoo);
		out.writeString(mBar);
	}
	
	@Override
	public int describeContents() {
		// TODO return Parcelable.CONTENTS_FILE_DESCRIPTOR if your class members 
		// include a FileDescriptor, otherwise you can simply return 0
		return 0;
	}
	
	public static final Parcelable.Creator<${objectKind}> CREATOR = new Parcelable.Creator<${objectKind}>() {
		public ${objectKind} createFromParcel(Parcel in) {
			return new ${objectKind}(in);
		}
		public ${objectKind}[] newArray(int size) {
			return new ${objectKind}[size];
		}
	};

}
